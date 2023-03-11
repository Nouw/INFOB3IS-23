byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byCar(metz,frankfurt).
byCar(saarbruecken,frankfurt).
byCar(metz,paris).
byCar(saarbruecken,paris).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(losAngeles,miami).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

% Base cases for all the travel locations
% travel(X, Y) :- byCar(X, Y).
% travel(X, Y) :- byTrain(X, Y).
% % Recursive steps
% travel(X, Y) :- byCar(X, Z), travel(Z, Y).
% travel(X, Y) :- byTrain(X, Z), travel(Z, Y).
% travel(X, Y) :- byPlane(X, Z), travel(Z, Y).

% travel(travel(X), travel(Y), Z) :- travel(X, Y, Z).

travel(X,Y,go(X,Y)) :- byCar(X,Y).
travel(X,Y,go(X,Y)) :- byPlane(X,Y).
travel(X,Y,go(X,Y)) :- byTrain(X,Y).

travel(X,Y, go(X,Z,G)) :- 
    byCar(X,Z),
    travel(Z,Y,G).

travel(X,Y, go(X,Z,G)) :-
    byPlane(X,Z),
    travel(Z,Y,G).

travel(X,Y,go(X,Z,G)) :-
    byTrain(X,Z),
    travel(Z,Y,G).

%% Base cases
travel(X,Y, go(X,Y)) :- byCar(X,Y).
travel(X,Y, go(X,Y)) :- byPlane(X,Y).
travel(X,Y, go(X,Y)) :- byTrain(X,Y).

%% Inductive cases
travel(X,Y, go(X,Z,G)) :-
  byCar(X,Z),
  travel(Z,Y,G).

travel(X,Y, go(X,Z,G)) :-
  byPlane(X,Z),
  travel(Z,Y,G).

travel(X,Y, go(X,Z,G)) :-
  byTrain(X,Z),
  travel(Z,Y,G).
