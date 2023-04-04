action(a, animals([H1,H2|T]), animals([H2,H1|T])).

action(b, animals([H|T]), animals(S)) :-
    omgedraaid([H|T], ReversedS),
    action(a, animals(ReversedS), animals(NS)),
    omgedraaid(NS, S).

action(x, animals([H|T]), animals(S)) :-
    omgedraaid(T, [X1,X2|T1]),
    plak(T1, [X2], Middle),
    plak([X1], Middle, Z),
    omgedraaid(Z, Y),
    plak([H], Y, S).

% ---- EXTRA -----
plak([], List, List) :- is_list(List).
plak([Head|Tail], List1, [Head|List2]) :- plak(Tail, List1, List2).

omgedraaid(L, R) :- omgedraaid(L, [], R).

omgedraaid([H|T], A, R) :-
    omgedraaid(T, [H|A], R).
omgedraaid([], A, A).

elementVan(X, [X|_]).
elementVan(X, [_|Tail]) :-
    elementVan(X, Tail).

% ---------- BFS --------------
bfs(Initieel, Doel, Pad) :-
    bfs(Doel, [node(Initieel, [])], ReversedPath, []),
    omgedraaid(ReversedPath, Pad).

bfs(Doel, [node(Doel, Pad) | _], Pad, _).
bfs(Doel, [node(Huidige, Pad1) | Nodes], Pad, Bezocht) :-
    findall(
        node(Volgende, [A | Pad1]),
        (action(A, Huidige, Volgende), \+ elementVan(Volgende, Bezocht)),
        Kinderen 
    ),
    plak(Nodes, Kinderen, Open),
    bfs(Doel, Open, Pad, [Huidige | Bezocht]).