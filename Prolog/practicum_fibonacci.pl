fibonacciL(1, 0).
fibonacciL(2, 1).
fibonacciL(N,Y) :- N>1, N1 is N-1, N2 is N-2, fibonacciL(N1, R1), fibonacciL(N2, R2), Y is R1+R2.