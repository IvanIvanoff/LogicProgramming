append([],B,B).
append([A|AS],B,[A|Res]):-
	append(AS,B,Res).

length([],0).
length([X|XS], N):-
	length(XS,M), N is M + 1.

% X e елементът на N-та позиция в L
nth(L,N,X) :-
	append(A,[X|_], L),
	length(A,N).

last_equal([X],[X]).
last_equal([X|XS], [Y|YS]):- 
	last_equal(XS,YS).

% Всички елементи без последния в първия списък са по-големи от елементите на същата позиция във втория сисък
ggreater([_],[_]).
ggreater([X|XS], [Y|YS]) :-
	X > Y,
	ggreater(XS,YS).

% Генерира всички последователни подсписъци
sl([],[]).
sl(L, X) :-
	append(A,B,L),
	append(X,C,B).

p(X,Y,Z) :-
	length(X,N),
	sl(Y,Z),			% Генерираме подспсък
	length(Z,N),		% Дължината му трябва да е равна на дължината на Х
	ggreater(Z,X),		% Всички елементи в Z без последния трябва да са по-големи от елементите на същата	 позиция в Х
	last_equal(X,Z).		% Последните елементи в двата списъка трябва да са еднакви