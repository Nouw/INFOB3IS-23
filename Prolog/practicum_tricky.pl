action(a, animals([H1,H2|T]), animals([H2,H1|T])).

action(b, animals([H|T]), animals(S)) :-
    reverse([H|T], ReversedS),
    action(a, animals(ReversedS), animals(NS)),
    reverse(NS, S).

action(x, animals([H|T]), animals(S)) :-
    reverse(T, [X1,X2|T1]),
    append(T1, [X2], Middle),
    append([X1], Middle, Z),
    reverse(Z, Y),
    append([H], Y, S).

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