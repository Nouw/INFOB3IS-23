valid(state(_, GL, LL, GR, LR)) :-
    GL >= LL,
    GR >= LR.

valid(state(_, GL, LL, GR, _)) :-
    GR == 0,
    GL >= LL.

valid(state(_, GL, _, GR, LR)) :-
    GL == 0,
    GR >= LR.

% 1 Gnoe steekt de rivier over. ->
action(cross(1, 0), state(left, G, L, GR, LR), state(right, NG, L, NGR, LR)) :-
    G > 0,
    NG is G - 1,
    NGR is GR + 1,
    valid(state(right, NG, L, NGR, LR)).

% 1 leeuw steeks over ->
action(cross(0, 1), state(left, G, L, GR, LR), state(right, G, NL, GR, NLR)) :-
    L > 0,
    NL is L - 1,
    NLR is LR + 1,
    valid(state(right, G, NL, GR, NLR)).

% 1 gnoe en 1 leeuwe steken over ->
action(cross(1, 1), state(left, G, L, GR, LR), state(right, NG, NL, NGR, NLR)) :-
    G > 0,
    L > 0,
    NG is G - 1,
    NL is L - 1,
    NGR is GR + 1,
    NLR is LR + 1,
    valid(state(right, NG, NL, NGR, NLR)).

% 2 Gnoes steken over ->
action(cross(2, 0), state(left, G, L, GR, LR), state(right, NG, L, NGR, LR)) :-
    G > 1,
    NG is G - 2,
    NGR is GR + 2,
    valid(state(right, NG, L, NGR, LR)).

% 2 Leeuwen steken over ->
action(cross(0, 2), state(left, G, L, GR, LR), state(right, G, NL, GR, NLR)) :-
    L > 1,
    NL is L - 2,
    NLR is LR + 2,
    valid(state(right, G, NL, GR, NLR)).

% 1 Gnoe steekt over <-
action(cross(1, 0), state(right, G, L, GR, LR), state(left, NG, L, NGR, LR)) :-
    GR > 0,
    NG is G + 1,
    NGR is GR - 1,
    valid(state(left, NG, L, NGR, LR)).

% 1 Leeuw steekt over <-
action(cross(0, 1), state(right, G, L, GR, LR), state(left, G, NL, GR, NLR)) :-
    LR > 0,
    NL is L + 1,
    NLR is LR - 1,
    valid(state(left, G, NL, GR, NLR)).

% 1 gnoe en 1 leeuwe steken over <-
action(cross(1, 1), state(right, G, L, GR, LR), state(left, NG, NL, NGR, NLR)) :-
    GR > 0,
    LR > 0,
    NG is G + 1,
    NL is L + 1,
    NGR is GR - 1,
    NLR is LR - 1,
    valid(state(left, NG, NL, NGR, NLR)).

% 2 Gnoes steken over <-
action(cross(2, 0), state(right, G, L, GR, LR), state(left, NG, L, NGR, LR)) :-
    GR > 1,
    NG is G + 2,
    NGR is GR - 2,
    valid(state(left, NG, L, NGR, LR)).

% 2 Leeuwen steken over <-
action(cross(0, 2), state(right, G, L, GR, LR), state(left, G, NL, GR, NLR)) :-
    LR > 1,
    NL is L + 2,
    NLR is LR - 2,
    valid(state(left, G, NL, GR, NLR)).

opposite(left, right).
opposite(right, left).

% ---------- BFS --------------

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