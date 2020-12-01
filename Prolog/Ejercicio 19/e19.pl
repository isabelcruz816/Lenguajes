% Problema 2: Comprime
comprime([P,P|R], W) :- !,
   comprime([P|R], W).
comprime([P|R], [P|W]) :- !,
   comprime(R, W).
comprime([], []).

% Problema 3: Duplica
duplica([P|R], [PR|RR]) :-
  P = [_|_], !,
  duplica(P, PR),
  duplica(R, RR).
duplica([P|R], [P, P|RR]) :- !,
  duplica(R, RR).
duplica([], []).

% Problema 4
% arbol(Raíz, SubárbolIzquierdo, SubárbolDerecho).
% Caso Base 2: Es un nodo hoja
hojas(arbol(_, nil, nil), 1).
% Caso General
hojas(arbol(_, SubIzq, SubDerecho), Hojas) :-
    !, hojas(SubIzq, I),
    hojas(SubDerecho, D),
    Hojas is I + D.
% Caso Base 1: El arbol vacio
hojas(nil, 0).

% Problema 5
busqueda(Arbol) :-
  write("Elemento? "),
  read(Elemento),
  busca(Elemento, Arbol), !,
  nivel(Elemento, Arbol, Nivel),
  write("Se encuentra en el nivel "),
  write(Nivel).
busqueda(_) :- write("No se encuentra en el arbol").

busca(Elemento, arbol(Elemento, _, _)) :- !.
busca(Elemento, arbol(_, Izq, _)) :- busca(Elemento, Izq), !.
busca(Elemento, arbol(_, _, Der)) :- busca(Elemento, Der).

nivel(Elemento, arbol(Elemento, _, _), 1) :- !.
nivel(Elemento, arbol(_, Izq, _), Nivel) :-
  nivel(Elemento, Izq, Ni), !,
  Nivel is Ni + 1.
nivel(Elemento, arbol(_, _, Der), Nivel) :-
  nivel(Elemento, Der, Nd), !,
  Nivel is Nd + 1.