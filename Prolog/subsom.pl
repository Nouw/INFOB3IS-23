sublijst([], _).
sublijst([H|T], [H|T1]) :- sublijst(T, T1).
sublijst([H|T], [_|T1]) :- sublijst([H|T], T1).

somlijstZ([], 0).

somlijstZ([H|T], S) :-
    number(H),
    somlijstZ(T, S1),
    S is S1 + H.

somlijst(L, S) :- somlijst(L, S, 0).
somlijst([], S, S).

subsom([], _, []) :- !.
somlijst([H|T], S, A) :-
    number(H),
    ANew is A + H,
    somlijst(T, S, ANew).


subsom([H1|T1], X, [H2|T2]) :-
    sublijst([H2|T2], [H1|T1]),
    somlijst([H2|T2], X).




