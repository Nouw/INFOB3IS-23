faculteitLeft(0, 1).
faculteitLeft(N, F) :-
    N > 0,
    N1 is N - 1,
    faculteitLeft(N1, F1),
    F is N * F1.


faculteitTail(N, F) :- faculteitTail(N, F, 1).

faculteitTail(0, F, F).
faculteitTail(N, F, A) :-
    N > 0,
    ANew is A * N,
    X is N - 1,
    faculteitTail(X, F, ANew).



