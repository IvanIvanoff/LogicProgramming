% not working
nat(0).
nat(X):- nat(Y), X is Y+1.

between(A, B, A):- A =< B.
between(A, B, X):- A =< B, A1 is A + 1, between(A1, B, X).

member(X, [X|_]).
member(X, [_|XS]):- member(X, XS).

subset(L, M):- not((
	member(L, X), not(member(M,X))
)).

prime(X):- 
	L is floor(sqrt(X)),
	not((between(2, L, Y), mod(X,Y) =:= 0)).

prime_factors(X, L) :-
	L is floor(sqrt(X)),
	between(2, L, Y),
	f(Y, X, L).

f(Y, X, [Y|L]) :- prime(Y), mod(X,Y) =:= 0.
f(Y, X, L) :- (not(prime(Y)); mod(X,Y) =\= 0).

