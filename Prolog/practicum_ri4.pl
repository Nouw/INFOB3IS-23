valid(state(_, GL, LL, GR, LR)) :-
    (GL >= LL ; GL = 0),           % Rule 1: Lions on the left should not be more than gnoes
    (GR >= LR),           % Rule 1: Lions on the right should not be more than gnoes
    (GL =< 0 ; LL =< 0),    % Check if number of lions or gnoes is negative
    (GR =< 0 ; LR =< 0).

% All the moves from the left side to the right side

% 1 Gnoe from left to right
action(cross(1, 0), state(left, GL, LL, GR, LR), state(Direction, NGL, LL, NGR, LR)) :-
    opposite(left, Direction), % Change the direction from left to right
    NGR is GR + 1,
    NGL is GL - 1,
    valid(state(Direction, NGL, LL, NGR, LR)).

% 2 Gnoes from left to right
action(cross(2, 0), state(left, GL, LL, GR, LR), state(Direction, NGL, LL, NGR, LR)) :-
    opposite(left, Direction), % Change the direction from left to right
    NGR is GR + 2,
    NGL is GL - 2,
    valid(state(Direction, NGL, LL, NGR, LR)).

% 1 Lion from left to right
action(cross(0, 1), state(left, GL, LL, GR, LR), state(Direction, GL, NLL, GR, NLR)) :-
    opposite(left, Direction),
    NLR is LR + 1,
    NLL is LL - 1,
    valid(state(Direction, GL, NLL, GR, NLR)).

% 2 Lions from left to right
action(cross(0, 2), state(left, GL, LL, GR, LR), state(Direction, GL, NLL, GR, NLR)) :-
    opposite(left, Direction),
    NLR is LR + 2,
    NLL is LL - 2,
    valid(state(Direction, GL, NLL, GR, NLR)).

% 1 Lion and 1 Gnoe from left to right
action(cross(1, 1), state(left, GL, LL, GR, LR), state(Direction, NGL, NLL, NGR, NLR)) :-
    opposite(left, Direction),
    NGR is GR + 1,
    NGL is GL - 1,
    NLR is LR + 1,
    NLL is LL - 1,
    valid(state(Direction, NGL, NLL, NGR, NLR)).

% All the moves from right to left

% 1 Gnoe from left to right
action(cross(1, 0), state(right, GL, LL, GR, LR), state(Direction, NGL, LL, NGR, LR)) :-
    opposite(right, Direction), % Change the direction from left to right
    NGR is GR - 1,
    NGL is GL + 1,
    valid(state(Direction, NGL, LL, NGR, LR)).

% 2 Gnoes from left to right
action(cross(2, 0), state(right, GL, LL, GR, LR), state(Direction, NGL, LL, NGR, LR)) :-
    opposite(right, Direction), % Change the direction from left to right
    NGR is GR - 2,
    NGR >= 0,
    NGL is GL + 2,
    valid(state(Direction, NGL, LL, NGR, LR)).

% 1 Lion from left to right
action(cross(0, 1), state(right, GL, LL, GR, LR), state(Direction, GL, NLL, GR, NLR)) :-
    opposite(right, Direction),
    NLR is LR - 1,
    NLR >= 0,
    NLL is LL + 1,
    valid(state(Direction, GL, NLL, GR, NLR)).

% 2 Lions from right to left
action(cross(0, 2), state(right, GL, LL, GR, LR), state(Direction, GL, NLL, GR, NLR)) :-
    opposite(right, Direction),
    NLR is LR - 2,
    NLR >= 0,
    NLL is LL + 2,
    valid(state(Direction, GL, NLL, GR, NLR)).

% 1 Lion and 1 Gnoe from right to left
action(cross(1, 1), state(right, GL, LL, GR, LR), state(Direction, NGL, NLL, NGR, NLR)) :-
    opposite(right, Direction),
    NGR is GR - 1,
    NGR >= 0,
    NGL is GL + 1,
    NLR is LR - 1,
    NLR >= 0,
    NLL is LL + 1,
    valid(state(Direction, NGL, NLL, NGR, NLR)).

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