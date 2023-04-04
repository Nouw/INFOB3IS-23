valid(state(_, GL, LL, GR, LR)) :-
	GL >= LL,
	GR >= LR.

valid(state(_, GL, LL, GR, _)) :-
	GR == 0,
	GL >= LL.	

valid(state(_, GL, _, GR, LR)) :-
	GL == 0,
	GR >= LR.
	
% 1 gnoe naar rechts
action(cross(1,0), state(left, GL, LL, GR, LR), state(right, NGL, LL, NGR, LR)) :-
	GL > 0,
	NGL is GL - 1,
	NGR is GR + 1,
	valid(state(right, NGL, LL, NGR, LR)).

% 1 leeuw naar rechts
action(cross(0,1), state(left, GL, LL, GR, LR), state(right, GL, NLL, GR, NLR)) :-
	LL > 0,
	NLL is LL - 1,
	NLR is LR + 1,
	valid(state(right, GL, NLL, GR, NLR)).

% gnoe en leeuw naar rechts
action(cross(1,1), state(left, GL, LL, GR, LR), state(right, NGL, NLL, NGR, NLR)) :-
	LL > 0,
	GL > 0,
	NLL is LL - 1,
	NLR is LR + 1,
	NGL is GL - 1,
	NGR is GR + 1,
	valid(state(right, NGL, NLL, NGR, NLR)).
	
% 2 gnoes naar rechts
action(cross(2,0), state(left, GL, LL, GR, LR), state(right, NGL, LL, NGR, LR)) :-
	GL > 1,
	NGL is GL - 2,
	NGR is GR + 2,
	valid(state(right, NGL, LL, NGR, LR)).

% 2 leeuwen naar rechts
action(cross(0,2), state(left, GL, LL, GR, LR), state(right, GL, NLL, GR, NLR)) :-
	LL > 1,
	NLR is LR + 2,
	NLL is LL - 2,
	valid(state(right, GL, NLL, GR, NLR)).
	
% 1 gnoe naar links
action(cross(1,0), state(right, GL, LL, GR, LR), state(left, NGL, LL, NGR, LR)) :-
	GR > 0,
	NGL is GL + 1,
	NGR is GR - 1,
	valid(state(left, NGL, LL, NGR, LR)).

% 1 leeuw naar links
action(cross(0,1), state(right, GL, LL, GR, LR), state(left, GL, NLL, GR, NLR)) :-
	LR > 0,
	NLL is LL + 1,
	NLR is LR - 1,
	valid(state(left, GL, NLL, GR, NLR)).

% gnoe en leeuw naar links
action(cross(1,1), state(right, GL, LL, GR, LR), state(left, NGL, NLL, NGR, NLR)) :-
	LR > 0,
	GR > 0,
	NLL is LL + 1,
	NLR is LR - 1,
	NGL is GL + 1,
	NGR is GR - 1,
	valid(state(left, NGL, NLL, NGR, NLR)).
	
% 2 gnoes naar links
action(cross(2,0), state(right, GL, LL, GR, LR), state(left, NGL, LL, NGR, LR)) :-
	GR > 1,
	NGL is GL + 2,
	NGR is GR - 2,
	valid(state(left, NGL, LL, NGR, LR)).	
	
% 2 leeuwen naar links
action(cross(0,2), state(right, GL, LL, GR, LR), state(left, GL, NLL, GR, NLR)) :-
	LR > 1,
	NLL is LL + 2,
	NLR is LR - 2,
	valid(state(left, GL, NLL, GR, NLR)).

%BFS, maar dan met zelfgemaakte predicaten
plak([], L, L) :- is_list(L).
plak([H|T], L, [H|S]) :- plak(T, L, S). 

omgedraaid(X, Y) :- omgedraaid(X, [], Y).

omgedraaid([H|T], X, R) :- omgedraaid(T, [H|X], R).
omgedraaid([], X, X).

element1(X, [X|_]).        
element1(X, [_|T]) :-   
	element1(X, T).       

bfs(Start, Goal, Path) :-
    bfs2(Goal, [node(Start, [])], ReversedPath, []),
    omgedraaid(ReversedPath, Path).

bfs2(Goal, [node(Goal, Path) | _], Path, _).
bfs2(Goal, [node(State, Path1) | Nodes], Path, Visited) :-
    findall(node(NextState, [A | Path1]), 
	(action(A, State, NextState),
	\+ element1(NextState, Visited)),Children),
    plak(Nodes, Children, Open),
    bfs2(Goal, Open, Path, [State | Visited]).