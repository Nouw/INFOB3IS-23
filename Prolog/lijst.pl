vanTot(X, X, [X]).
vanTot(X, Y, [X|R]) :-
    number(X),
    number(Y),
    X < Y,
    N is X + 1,
    vanTot(N, Y, R).


lijstsom([], 0).
lijstsom([H|T],S) :-
    
