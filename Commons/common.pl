member(X, [X|_]).
member(X, [_|XS]):- member(X,XS).

p(L) :- 
	not((
		member(X,L),
		member(Y,L),
		X =\= Y,

		not((
			member(W,X),
			member(W,Y)

			member(Z,L),
			X=\=Z, Y=\=Z,
			member(W,Z)
		)).
	)).

