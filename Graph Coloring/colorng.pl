member(X, [X|_]).
member(X, [_|XS]) :- member(X, XS).

append([],B,B).
append([A|AS], B,[A|Res]) :- append(AS,B,Res).

disjoint_set(V,[],V).
disjoint_set(V, V, []).
disjoint_set([X|XS], [X|L], R) :- disjoint_set(XS, L, R).
disjoint_set([X|XS], L, [X|R]) :- disjoint_set(XS, L, R).

cycle3(V, E) :- 
	member(X, V), member(Y, V), member(Z, V),
	member([X,Y], E), member([Y,Z], E), member(,[Z,X], E),
	X \= Y, X \= Z, Y \= Z.

list([]).
list([_|_]).

flat([],[]).
flat([H|T], F):- 
	list(H),
	flat(H,F1),
	flat(T,F2),
	append(F1,F2,F).

flat([H|T], [H|F]) :- 
	not(list(H)), 
	flat(T,F).

distinct([],[]).
distinct([H|T], [H|Res]):-
	not(member(H, T)),
	distinct(T,Res).

distinct([H|T], Res):-
	member(H,T),
	distinct(T,Res).

p(G) :- 
	flat(G, V1),
	distinct(V1,V),
	disjoint_set(V, L, R),
	not((cycle3(L,G), cycle3(R, G))).