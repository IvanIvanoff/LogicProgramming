append([], B, B).
append([A|AS], B, [A|Rest]) :-
	append(AS,B,Rest).

list([]).
list([_|_]).

flat([],[]).
flat([X|XS], F) :-
	list(X), 
	flat(X, F1), 
	flat(XS,F2), 
	append(F1,F2,F).

flat([X|XS], [X|F]) :-
	not(list(X)),
	flat(XS,F).