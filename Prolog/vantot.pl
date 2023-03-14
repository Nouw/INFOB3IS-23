vanTot(X, X, [X]).
vanTot(X, Y, [X|R]) :-
    number(X),
    number(Y),
    X < Y,
    N is X + 1,
    vanTot(N, Y, R).

vanTot(X, Y, [X|R]) :-
    number(X),
    number(Y),
    X > Y,
    N is X - 1,
    vanTot(N, Y, R).

    

invoeging(X, L1, [X|L1]).
invoeging(X, [Y|L1], [Y|L2]) :- invoeging(X, L1, L2).




