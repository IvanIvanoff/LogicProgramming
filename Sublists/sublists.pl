% not working
member(X,[X|_]).
member(X,[_|XS]):- 
	member(X,XS).

append([],B,B).
append([A|AS],B[A|Res]):-
	append(AS,B,Res).

length([],0).
length([X|XS], N):-
	length(XS,M), N is M + 1.

% X e елементът на N-та позиция в L
nth(L,N,X) :-
	append(A,[X|_], L),
	length(A,N).

last_equal(X,Y) :-
	length(X,N), length(Y,N),
	nth(X,N,XL), nth(Y,N,YL),
	XL =:= YL.

greater([],[]).
greater([X|XS], [Y|YS]) :-
	X > Y,
	greater(XS,YS).

p(X,Y,Z) :-
	length(X,N),			% N e дължината на X
	append(L,R,Y),			% L и R са такива подсписъци, че удовлетворяват условията на задачата
	(( 	length(L,N),		% |X| == |L|
		greater(L, X),		% Всеки елемент от L е по-голям от елемента на същата позиция в X
		last_equal(X,L),		% Последните елементи на X и L са равни
		Z is L)			% Z e L
	;
	(	length(R,N),
		greater(R,X),
		last_equal(R,X),
		Z is R)
	).