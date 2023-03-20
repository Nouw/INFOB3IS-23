% 6.1
doubled(L) :- append(X, X, L).

% 6.2
palindrome([]).
palindrome([_]).
palindrome([H|T]) :-
    append(M, [H], T),
    palindrome(M).

% 6.3
toptail(InList, OutList) :-
    append([_ | OutList], [_], InList).

% 6.4
last(List, X) :- reverse(List, [X|_]). 

% 6.5
swapfl([], []).
swapfl([H1|T1], [H2|T2]) :-
    reverse(T1, [L1|R1]),
    reverse(T2, [L2|R2]),
    F1 = L2,
    L1 = F2,
    R1 = R2.

% 6.6
prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).
sublist(SubL,L) :- suffix(S,L), prefix(SubL,S).

zebra(Owner) :-
    Street = [_, _, _],
    member(house(red, englishman, _), Street),
    member(house(_, spanish, jaguar), Street),
    member(house(_, Owner, zebra), Street),
    sublist([house(_, _, snail), house(_, japanese, _)], Street),
    sublist([house(_, _, snail), house(blue, _, _)], Street).

