house_elf(dobby).
witch(hermoine).
witch('McGonagall').
witch(rita_skeeter).

magic(X) :- house_elf(X).
% magic(X) :- wizard(X).
magic(X) :- witch(X).
% Exercise 2.3
% word(determiner, a).
% word(determiner, every).
% word(noun, criminal).
% word(noun, 'big kahuna burger').
% word(verb, eats).
% word(verb, likes).

% sentence(Word1, Word2, Word3, Word4, Word5) :-
%     word(determiner, Word1),
%     word(noun, Word2),
%     word(verb, Word3),
%     word(determiner, Word4),
%     word(noun, Word5).

% Exercise 2.4.
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, _, A1, _, B1, _, C1, _),
    word(H1, _, A1, _, A2, _, A3, _),
    word(V2, _, A2, _, B2, _, C2, _),
    word(H2, _, B1, _, B2, _, B3, _),
    word(V3, _, A3, _, B3, _, C3, _),
    word(H3, _, C1, _, C2, _, C3, _).