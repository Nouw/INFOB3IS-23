sublijst([], _).
sublijst([H|T], [H|T1]) :- sublijst(T, T1).
sublijst([H|T], [_|T1]) :- sublijst([H|T], T1).