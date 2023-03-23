% Exercise 11.2
q(blob, blug).
q(blob, blag).
q(blob, blig).
q(blaf, blag).
q(dang, dong).
q(dang, blug).
q(flag, blob).

% Exercise 11.3
% Before running this, type in "dynamic sigmares/2."

sigma(0, 0).
sigma(N, R) :-
    sigmares(N,R), !.

sigma(N, R) :-
    N > 0,
    N1 is N - 1,
    sigma(N1, R1),
    R is R1 + N,
    assert(sigmares(N, R)).