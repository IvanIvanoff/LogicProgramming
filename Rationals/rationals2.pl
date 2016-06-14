nat(0).
nat(X) :- nat(Y), X is Y + 1.

between(A,B,A):- A =< B.
between(A,B,X):- A =< B, A1 is A + 1, between(A1,B,X).

% k(K, N, X) => Х е к-орка числа, сумиращи се до N

k(0,_,[]).
k(1, N, [N]).
k(K,N, [X|XS]) :- N > 0, K > 1,
	between(0, N, X), K1 is K-1, N1 is N-X,
	k(K1,N1,XS).

% N > M > 0
% L > K > 0
% M/N  * K/L = 2
% M + K < A

p(A, [M,N], [K,L]):-
	nat(S),
	k(4, S, [M,N,K,L]),
	N > M, M > 0, L > K, K > 0,
	(M/N) * (K/L) =:= 2,
	M + K < A.

