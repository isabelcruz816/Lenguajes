% Implementacion de la funcion member
% Caso base: x es el primer emento de la lista
miembro(X, [X|_]).
% Caso general: x es elemento de una lista si x aparece en el resto
miembro(X, [_|XS]) :-
  miembro(X, XS).

% Funcion Length
% Caso general: Al menos un elemento
longitud([_, XS], N) :-
  !, longitud(XS, Nr),
  N is Nr + 1.
% Caso base: la longitud de una lista vacia
longitud([], 0).

% Concatenacion
concatena([X|XS], L2, [X|L3]) :-
  concatena(XS, L2, L3).
% Caso base
concatena([], L2, L2).

% Interseccion de 2 conjuntos, elementos en comun
% \+ not
% Caso general: cuando X no esta en el C2
interseccion([X|XS], C2, C3) :-
  \+ miembro(X, C2), !, interseccion(XS, C2, C3).
% Caso general: cuando X esta en el C2
interseccion([X|XS], C2, [X|C3]) :-
  !, interseccion(XS, C2, C3).

% Caso base
interseccion([], _, []).
