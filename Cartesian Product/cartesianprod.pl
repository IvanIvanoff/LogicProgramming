member(X,[X|_]). %! If the first element in the list is X, then it obviously is a member
member(X,[_|XS]) :- member(X,XS). %! If we reach here we are sure that the first element is NOT X, but it may be in XS 

p([],[]).
p([L|LS], [X|XS]) :- member(X,L), p(LS,XS).
