% action_scheme(move_to_table(b1, b2),[on(b1, b2), clear(b1), block(b1), block(b2)],[on(b1, table), clear(b2)],[on(b1,b2)]).

elementVan(X, [X|_]).
elementVan(X, [_|Tail]) :-
    elementVan(X, Tail).


action_scheme(move_to_table(B, X), Preconditions, Add, Delete) :-
    is_list(Preconditions),
    elementVan(on(B, X), Preconditions),
    elementVan(clear(B), Preconditions),
    elementVan(block(B), Preconditions),
    elementVan(block(X), Preconditions).

action_scheme(move(B, X, Y), Preconditions, Add, Delete) :-
    is_list(Preconditions),
    elementVan(on(B, X), Preconditions),
    elementVan(clear(B), Preconditions),
    elementVan(clear(Y), Preconditions),
    elementVan(block(B), Preconditions),
    elementVan(block(Y), Preconditions),
    B \= X,
    B \= Y,
    X \= Y.