spiegel(leaf(X), leaf(X)).
spiegel(tree(A, B), tree(C, D)) :-
    spiegel(A, D),
    spiegel(B, C).

