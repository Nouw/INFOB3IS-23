action(north,(1,1),(1,2)).
action(go(1,5),1,5).
action(go(2,3),2,3).
action(hop(2,4),2,4).
action(yes(5,6),5,6).
action(go(5,11),5,11).
action(hup(3,7),3,7).
action(go(4,8),4,8).
action(hopla(4,9),4,9).
action(go(6,10),6,10).

% One of the steps is findall(X, action(_, y, X), Z)
% Where X is the paths that you can go to from y, and Z is the list containing all the options.

search(Start, Goal, Path) :- search([Start], [], Goal, Path).

search([Goal | T], _, Goal, Path).

search([Huidige | T], Bezocht, Goal, Path) :-
    findall(Volgende, 
        (action(_, Huidige, Volgende), 
        \+ member(Volgende, [Huidige | Bezocht])), 
        VolgendeNodes),
    append(T, [Volgende | Bezocht], NewQueue),
    search(NewQueue, [Huidige | Bezocht], Goal, Path).


bfs2(Initieel, Goal, Plan) :-
    bfs2([Initieel], Initieel, Goal, Plan).

bfs2([Goal | _], Initieel, Goal, Plan) :-
    findParent(Goal, Initieel, Plan).

bfs2([QH | QT], Initieel, Goal, Plan) :-
    findall(X, (action(_, QH, X), \+ member(X, QT)), Children),
    append(QT, Children, NQ), 
    bfs2(NQ, Initieel, Goal, Plan).

% findParent(Goal, Goal, Path).
% findParent(Current, Goal, Plan) :-
%     findall(Node, action(_, Node, Current), [Parent | _]),
%     append([Parent], Plan, X),
%     findParent(Parent, Goal, X).

findParent(Current, Goal, Path) :-
    findParent(Current, Goal, [], PathRev),
    reverse(PathRev, Path).

findParent(Current, Current, AccPath, [Current|AccPath]).

findParent(Current, Goal, AccPath, Path) :-
    action(_, Parent, Current),
    \+ member(Parent, AccPath),
    findParent(Parent, Goal, [Current|AccPath], Path).
