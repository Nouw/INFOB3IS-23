
action(north, pos(X, Y1), pos(X, Y2)) :-
    integer(X),
    integer(Y1),
    Y2 is Y1 + 1,
    num_rows(NumRows),
    Y2 =< NumRows,
    \+ occupied(pos(X, Y2)).

action(east, pos(X1, Y), pos(X2, Y)) :-
    integer(X1),
    integer(Y),
    X2 is X1 + 1,
    num_col(NumCols),
    X2 =< NumCols,
    \+ occupied(pos(X2, Y)).

action(south, pos(X, Y1), pos(X, Y2)) :-
    integer(X),
    integer(Y1),
    Y2 is Y1 - 1,
    Y2 >= 1,
    \+ occupied(pos(X, Y2)).

action(west, pos(X1, Y), pos(X2, Y)) :-
    integer(X1),
    integer(Y),
    X2 is X1 - 1,
    X2 >= 1,
    \+ occupied(pos(X2, Y)).

bfs(Initieel, Doel, Pad) :-
    bfs(Doel, [node(Initieel, [])], ReversedPath, []),
    reverse(ReversedPath, Pad).

bfs(Doel, [node(Doel, Pad) | _], Pad, _).
bfs(Doel, [node(Huidige, Pad1) | Nodes], Pad, Bezocht) :-
    findall(
        node(Volgende, [A | Pad1]),
        (action(A, Huidige, Volgende), \+ member(Volgende, Bezocht)),
        Kinderen 
    ),
    append(Nodes, Kinderen, Open),
    bfs(Doel, Open, Pad, [Huidige | Bezocht]).

