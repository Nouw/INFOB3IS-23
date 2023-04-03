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