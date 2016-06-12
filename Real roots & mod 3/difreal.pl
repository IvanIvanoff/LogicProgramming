nat(0).
nat(X) :- nat(Y), X is Y+1.

between(A,B,A):- A =< B.
between(A,B,X):- A =< B, A1 is A + 1, between(A1, B,X).

% gen_k(K, N, L) - генерира в L всички списъци от K естествени числа, които се сумират до N
k(1, 0, [0]).
k(0, _, []).
k(1, N, [N]):- N > 0.
k(K, N, [0|XS]):- K > 1, N > 0, M is K-1, k(M, N, XS).
k(K, N, [X|XS]):- K > 1, N > 0, M is K-1, between(1, N, X), Y is N - X, k(M, Y, XS).

% Два различни реални корена означават детерминанта, по-голяма от нула
dif_real_roots(A,B,C):-
	A =\= 0,
	(B*B - 4*A*C) > 0.

% Предикатът nat(N) се преудовлетворява,
% Генерираме всички естествени числа и всички тройки естествени числа, които се сумират до N,
% т.е. генерираме всички възможни тройки естествени числа.
% За всяка тройка числа проверяваме дали дава остатък 1 при деление на 3 и дали
% квадратното уравнение A*X*X + B*X + C = 0 има два различни реални корена.
p(A,B,C):-
	nat(N),
	k(3, N, [A,B,C]),
	mod(A*B*C, 3) =:= 1,
	dif_real_roots(A,B,C).