% Implementacion de la funcion member
% Caso base: x es el primer emento de la lista
miembro(X, [X|_]).
% Caso general: x es elemento de una lista si x aparece en el resto
miembro(X, [_|XS]) :-
  miembro(X, XS).

% Verificar si un dato es miembro de un arbol
% Caso base: x es igual a root
miembro(X, arbol(X, _, _)) :- !.

miembro(X, arbol(_, Izq, _)) :-
  miembro(X, Izq), !.

miembro(X, arbol(_,_,Der)) :-
  miembro(X, Der).

% Recorridos
preorden(arbol(R, I, D), L):-
  !, preorden(I, Rizq),
  preorden(D, Rder),
  append([R|Rizq], Rder, L).

preorden(nil, []).