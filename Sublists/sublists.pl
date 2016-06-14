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



% Всички елементи без последния в първия списък са по-големи от елементите на същата позиция във втория сисък
greater_and_last_equal([X],[X]).
greater_and_last_equal([X|XS], [Y|YS]) :-
	X > Y,
	greater_and_last_equal(XS,YS).

% Генерира всички последователни подсписъци
sl([],[]).
sl(L, X) :-
	append(A,B,L),
	append(X,C,B).

p(X,Y,Z) :-
	length(X,N),
	sl(Y,Z),			
	greater_and_last_equal(Z,X).	