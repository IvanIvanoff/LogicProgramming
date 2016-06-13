member(X,[X|_]).
member(X,[_|XS]) :- member(X,XS).

p([],[]).
p([L|LS], [X|XS]) :- member(X,L), p(LS,XS).

