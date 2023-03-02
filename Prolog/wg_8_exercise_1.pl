kindVan(juliana,wilhelmina).
kindVan(beatrix,juliana).
kindVan(irene,juliana).
kindVan(margriet,juliana).
kindVan(christina,juliana).
kindVan(beatrix,bernhard).
kindVan(irene,bernhard).
kindVan(margriet,bernhard).
kindVan(christina,bernhard).
kindVan(willemAlexander,beatrix).
kindVan(willemAlexander,claus).
kindVan(amalia,willemAlexander).
kindVan(alexia,willemAlexander).
kindVan(ariane,willemAlexander).
kindVan(amalia,maxima).
kindVan(alexia,maxima).
kindVan(ariane,maxima).
kindVan(johanFriso,beatrix).
kindVan(johanFriso,claus).
kindVan(luana,johanFriso).
kindVan(zaria,johanFriso).
kindVan(constantijn,beatrix).
kindVan(constantijn,claus).
kindVan(eloise,constantijn).
kindVan(clausCasimir,constantijn).
kindVan(leonore,constantijn).
kindVan(carlos,irene).
kindVan(jaime,irene).
kindVan(margarita,irene).
kindVan(julia,margarita).
kindVan(mariaCarolina,irene).
kindVan(maurits,margriet).
kindVan(anna,maurits).
kindVan(lucas,maurits).
kindVan(felicia,maurits).
kindVan(bernhardJr,margriet).
kindVan(isabella,bernhardJr).
kindVan(samuel,bernhardJr).
kindVan(benjamin,bernhardJr).
kindVan(pieterChristiaan,margriet).
kindVan(emma,pieterChristiaan).
kindVan(pieter,pieterChristiaan).
kindVan(floris,margriet).
kindVan(magali,floris).
kindVan(eliane,floris).
kindVan(bernardo,christina).
kindVan(isabel,bernardo).
kindVan(nicolas,christina).
kindVan(juliana81,christina).

%oorspronkelijk:
       %stamtAfVan(X,Y) :- kindVan(X,Y).  % kind X stamt af van ouder Y
       %stamtAfVan(X,Y) :-
       %   kindVan(X,Z),
       %   stamtAfVan(Z,Y).
% stamtAfVan(X,Y) :- kindVan(X,Y).  % kind X stamt af van ouder Y
% stamtAfVan(X,Y) :-
%     stamtAfVan(X,Z),
%     stamtAfVan(Z,Y).

stamtAfVan(X,Y) :- kindVan(X,Y).  % kind X stamt af van ouder Y
stamtAfVan(X,Y) :-
    kindVan(Z,Y),
    stamtAfVan(X,Z). % XstamtookafvanYals %ZkindisvanY %XafstamtvanZen

% Exercise 3.2 from LPN
% in(katarina, olga).
% in(olga, natasha).
% in(natasha, irina).

% directlyIn(X, Y) :- in(X, Y).

% directlyIn(X, Y) :- in(X, Z), directlyIn(Z, Y).

% Exercise 2
% a
in(irina, natasha).
in(natasha, olga).
in(olga, katarina).

inDirect(X, Y) :- in(X, Y).

inDirect(X, Y) :- in(X, Z), inDirect(Z, Y).

% Exercise 3
directeTrein(saarbruecken,dudweiler).
directeTrein(forbach,saarbruecken).
directeTrein(freyming,forbach).
directeTrein(stAvold,freyming).
directeTrein(fahlquemont,stAvold).
directeTrein(metz,fahlquemont).
directeTrein(nancy,metz).

reisVanNaar(X, Y) :- directeTrein(X, Y).

reisVanNaar(X, Y) :- directeTrein(X, Z) , reisVanNaar(Z, Y).

% Exercise 4
numeral(0).

numeral(succ(X)) :- numeral(X).

groterDan(Y, 0).
groterDan(succ(X), succ(Y)) :- groterDan(X, Y). 

% Exercise 5
swap(leaf(X), leaf(Y)).
swap(tree(B1, B2), tree(B2Swapped, B1Swapped)) :-
    swap(B1, B1Swapped),
    swap(B2, B2Swapped).

ouder(juliana, bea).
ouder(bea, wa).
ouder(claus, wa).
ouder(maxima, amalia).
ouder(wa, amalia).
ouder(wa, alexia).

