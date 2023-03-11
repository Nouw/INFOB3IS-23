omgedraaid(Xs, Ys) :-
    omgedraaid(Xs, [], Ys, Ys).
    
omgedraaid([], Ys, Ys, []).
  
omgedraaid([X|Xs], Rs, Ys, [_|Bound]) :-
    omgedraaid(Xs, [X|Rs], Ys, Bound).