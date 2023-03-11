% De base case
permutatieI([], []).
% Recursieve stap, check of X bij L1 kan worden toegevoegd
% om L2 te maken en L2 een permutatie is van L3.
permutatieI([X|L1], L3) :-
    permutatieI(L1, L2),
    invoeging(X, L2, L3).

% Functie om elementen aan een lijst
% toe te voegen.
invoeging(X, L1, [X|L1]).
invoeging(X, [Y|L1], [Y|L2]) :- invoeging(X, L1, L2).


