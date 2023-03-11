% Base Case
plak([], [X|Y], [X|Y]).
plak([X|Y], [], [X|Y]).
% Recursieve stap, voeg steeds een element toe tot dat de lijst leeg is
plak([H | T1], L, [H | T2]) :-
    plak(T1, L, T2).

% Voorbeeld uit het boek.
omgedraaid(L, R) :- omgedraaid(L, [], R).

omgedraaid([H|T], A, R) :-
    omgedraaid(T, [H|A], R).
omgedraaid([], A, A).

% omgedraaid(L, R) :-
%     omgedraaid(L, [], R).
% % Recursive stap
% omgedraaid([H|T], A, R) :-
%     omgedraaid(T, [H|A], R).
% % Base Case
% omgedraaid([], [X|Y], [X|Y]).

% Base cases
palindroomPlak([]).
% 1 element is een palindroom
palindroomPlak([_]).
% Recursieve stap
% Checkt of de buitenste elementen gelijk aan elkaar zijn
% Zo ja, dan gaat het verder met de rest van de lijst
% Tot dat het bij de base case komt.
palindroomPlak([H|T]) :-
    plak(M, [H], T),
    palindroomPlak(M).

% Base case
palindroomDraai([]).
% Recursieve stap
% Draaien de lijst om en als die hetzelfde is als de orginele lijst
% Dan is het een palindroom.
palindroomDraai(L) :-
    omgedraaid(L, R),
    R = L.