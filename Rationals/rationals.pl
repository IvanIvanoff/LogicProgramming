nat(0).
nat(X):-  nat(Y), X is Y + 1.

between(A, B, A):- A =< B.
between(A, B, X):- A =< B, A1 is A + 1, between(A1, B, X).

pair(L, N):-
	between(0, N, X), Y is N - X,
	L = [Y,X].

prod([M,N], [K,L], T) :- ((M*K)/(N*L)) =:= T.

p(A, [M,N], [K,L]) :-
	between(2, A, A1),
	pair([M,N], A1), N =\= 0, M < N,
	between(2, A, A2),
	pair([K,L], A2), L =\= 0, K > L,
	prod([M,N],[K,L], 2),
	M + K < A.