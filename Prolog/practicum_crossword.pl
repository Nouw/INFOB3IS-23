crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, _, A1, _, B1, _, C1, _),
    word(H1, _, A1, _, A2, _, A3, _),
    word(V2, _, A2, _, B2, _, C2, _),
    word(H2, _, B1, _, B2, _, B3, _),
    word(V3, _, A3, _, B3, _, C3, _),
    word(H3, _, C1, _, C2, _, C3, _).




