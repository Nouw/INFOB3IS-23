% Base Cases
fibonacciL(1, 1).
fibonacciL(2, 1).
% Recursieve stap
fibonacciL(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacciL(N1, F1),
    fibonacciL(N2, F2),
    F is F1 + F2.

% Voeg een accumulator toe. En zet die op 1 (aka de base cases)
fibonacciT(N, F) :- fibonacciT(N, 1, 1, F).

% Base case
fibonacciT(1, X, _, X).
% Recursieve stap
% A en B zijn de accumulator zodat we in de volgende stap die
% weer kunnen hergebruiken.
fibonacciT(N, A, B, F) :-
    N > 1,
    N1 is N - 1,
    S is A + B,
    fibonacciT(N1, B, S, F).