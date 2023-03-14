verwijder3([], []).

verwijder3([3|T1], R) :-
    verwijder3(T1, R).

verwijder3([H|T], [H|R]) :-
    H \= 3,
    verwijder3(T, R).




