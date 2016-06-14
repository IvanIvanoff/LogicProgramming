between(A,B,A):- A =< B.
between(A,B,X):- A =< B, A1 is A + 1, between(A1, B, X).

in_circle(X1,Y1, R, P1, P2) :-
	(P1 - X1) * (P1 - X1) + (P2 - Y1)*(P2 - Y1) < R*R.

square_to_interval(X1,Y1, A, I1, I2,J1,J2) :-
	I1 is X1,
	I2 is I1 + A,
	J1 is Y1,
	J2 is Y2 + A

p(X1,Y1, A, X2,Y2, R, X,Y) :-
	square_to_interval(X1,Y1, A, I1,I2, J1,J2),
	between(I1, I2, X),
	between(J1, J2, Y),
	in_circle(X2,Y2,R).