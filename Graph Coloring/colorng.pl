member(X, [X|_]).
member(X, [Y|XS]) :- Y \= X, member(X, XS).

disjoint_set(V,[],V).
disjoint_set(V, V, []).
disjoint_set([X|XS], [X|L], R) :- disjoint_set(XS, L, R).
disjoint_set([X|XS], L, [X|R]) :- disjoint_set(XS, L, R).

cycle3(V, E) :- 
	member(X, V), member(Y, V), member(Z, V),
	member([X,Y], E), member([Y,Z], E), member(,[Z,X], E),
	X \= Y, X \= Z, Y \= Z.

getV(V, []).
getV([],[]).
getV([X|V], [[X,Y]|ES]) :-
	not(member(X, V)),
	member(Y, V),
	getV(V, ES).
getV([Y|V], [[X,Y]|ES]) :-
	member(X, V), 
	not(member(Y,V)), 
	getV(V, ES).
getV(V,[[X,Y]|ES]) :-
	member(X,V), 
	member(Y,V), 
	getV(V, ES).
getV([X,Y|ES], [X,Y|ES]) :-
	not(member(X,V)), 
	not(member(Y,V)), 
	getV(V,ES).

p(G) :- 
	getV(V, G), 
	disjoint_set(V, L, R),
	not((cycle3(L,G), cycle3(R, G))).