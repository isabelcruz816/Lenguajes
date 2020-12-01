% Problema 1
xor(C1, C2) :-
  C1, not(C2), !.
xor(C1, C2) :-
  not(C1), C2, !.

% Problema 2
enesimo(N, L, M):-
  enesimo_aux(N, L, M, 1).
enesimo_aux(N, [X|_], M, N) :-
  M is X, !.
enesimo_aux(N, [_|XS], M, C) :-
  C1 is C + 1,
  enesimo_aux(N, XS, M, C1).
  
% Problema 3
intersectan([X|_], [X|_]) :- !.
intersectan([_|XS], [_|YS]) :- 
  !, intersectan(XS, YS).

% Problema 4
rango(Inicio, Fin, R) :-
    rangoAux(Inicio, Fin, [], R),
    !.

rangoAux(Inicio, Fin, Acum, R) :-
    Inicio =\= Fin,
    append(Acum, [Inicio], R2),
    I2 is Inicio+1,
    rangoAux(I2, Fin, R2, R), 
    !.

rangoAux(Inicio, Fin, Acum, R) :-
    Inicio =:= Fin,
    append(Acum, [Fin], R),
    !.

% Problema 5
cartesiano([], _, []):- !.

cartesiano([Head|Tail], M2, R) :-
    carAux(Head, M2, O),
    cartesiano(Tail, M2, P),
    append(O, P, R),
    !.

carAux(_, [], []):-
    !.

carAux(Elemento, [H1|T2], R):-
    append([Elemento], [H1], A),
    append([A], [], E),
    carAux(Elemento, T2, O),
    append(E, O, R),
    !.

% Caso base 1: se pasa una longitud que no es valida
% Caso base 2: la lista vacia
% Caso general: se pasa una longitud valida
divide([], _, [], []) :- !.
divide(Lista,0,[],Lista):- !.
divide([X|XS],N,[X|L1],L2) :- 
  N > 0, !, 
  N1 is N - 1,
  divide(XS,N1,L1,L2).
divide(_,N,L1,L2) :- 
  N < 0,
  divide(_,N,L1,L2), !.

% Caso base 1: la lista vacia
agrega(_, _, [], []):- !.
% Caso base 2: agregar cada 0 posiciones
agrega(_, 0, _, []):- !.
% Caso general:
agrega(Pos, Pos, Lista, R):-
  agrega_aux(X, Pos, Pos, Lista, R).

agrega_aux(Elemento, 0, Pos, [X|XS], [Elemento|YS]):-
  agrega_aux(Elemento, Pos, Pos, XS, YS), !.

agrega_aux(Elemento, M, Pos, [X|XS], R):-
  M is Pos-1, !,
  agrega_aux(Elemento, M, Pos, XS, R).
