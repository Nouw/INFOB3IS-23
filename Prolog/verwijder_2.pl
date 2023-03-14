verwijdering(_, [], []).
verwijdering(X, [X | T1], T2) :-
    verwijdering(X, T1, T2).
verwijdering(X, [H | T1], [H | T2]) :-
    X \= H,
    verwijdering(X, T1, T2).


verwijder([], L, L).
verwijder([H|T], [H|T], []).
verwijder([X|Xs], L1, L2) :-
    verwijdering(X, L1, L3),
    verwijder(Xs, L3, L2).






