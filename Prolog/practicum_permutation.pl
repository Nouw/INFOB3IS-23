% De base case
permutatieI([], []).
% Recursieve stap, check of X bij L1 kan worden toegevoegd
% om L2 te maken en L2 een permutatie is van L3.
permutatieI([X|L1], L3) :-
    invoeging(X, L2, L3),
    permutatieI(L1, L2).

% Base case
permutatieV([], []).
% Recursieve stap verwijder een element uit de lijst
% Ga door met de rest van de lijst die je over hebt (L1) totdat je bij
% De base case uitkomt.
permutatieV(L, [H | T]) :-
    permutatieV(L1, T),
    verwijdering(H, L, L1).

% Functie om elementen aan een lijst
% toe te voegen.
invoeging(X, L1, [X|L1]).
invoeging(X, [Y|L1], [Y|L2]) :- invoeging(X, L1, L2).

% Pak het element X en haalt het uit de lijst, ga dan verder met lijst T.
verwijdering(X, [X | T], T).
verwijdering(X, [H | T1], [H | T2]) :-
    verwijdering(X, T1, T2).



