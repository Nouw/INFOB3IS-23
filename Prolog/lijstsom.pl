somlijstZ([], 0).

somlijstZ([H|T], S) :-
    number(H),
    somlijstZ(T, S1),
    S is S1 + H.

somlijst(L, S) :- somlijst(L, S, 0).
somlijst([], S, S).

somlijst([H|T], S, A) :-
    number(H),
    ANew is A + H,
    somlijst(T, S, ANew).


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

lijstsom(L, S) :- lijstsom(L, S, 1).

lijstsom(L, S, A) :- 
    vanTot(1, A, L),
    somlijst(L, Sum),
    Sum = S.

lijstsom(L, S, A) :-
    AN is A + 1,
    AN < S,
    lijstsom(L, S, AN).
