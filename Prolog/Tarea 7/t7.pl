% xor
% xor(true,false).
xor(true, false).
xor(false, true).
% Caso general
xor(A, B) :-
   A , not(B), !.
xor(A, B) :-
   not(A) , B, !.

% enesimo
% enesimo(3,[-1,6,2,-3],M). => M = 2.
% Caso Base: Lista Vacia
% Caso General, M empieza en 1
enesimo(N, L, M) :-
    enesimo_aux(N, L, M, 1).
% Caso General A: Es el primer elemento
enesimo_aux(N, [X|_], M, N) :-
    M is X, !.
% Caso General B: No es el primer elemento
enesimo_aux(N, [_|XS], M, C) :-
    C1 is C + 1,
    enesimo_aux(N, XS, M, C1).

% 6 - 9
cuenta_profundo(Target, List, Result) :-
    cuenta_profundo(Target, List, 0, Result).
cuenta_profundo(Target, [Target|Rest], M, Result) :-
    Z is M + 1,
    cuenta_profundo(Target, Rest, Z, Result).

cuenta_profundo(Target, [List1|List2], M, Result) :-
    is_list(List1),
    cuenta_profundo(Target, List1, 0, Result1),
    cuenta_profundo(Target, List2, 0, Result2),
    Result is M + Result1 + Result2,
    !.

cuenta_profundo(Target, [_|Rest], M, Result) :-
    cuenta_profundo(Target, Rest, M, Result), !.

cuenta_profundo(C, [], M, M) :- !.


tabla(Num, R) :-
    tabla(Num, 1, R).

tabla(_, 11, _) :- !.
tabla(Num, Factor, [[[Num, Factor], X] | W ]) :-
    !,
    X is Num * Factor,
    F is Factor + 1,
    write(Num) ,write('*'), write(Factor), write(' = '), write(X), nl,
    tabla(Num, F, W).



miembro(X, [X|_]) :- !.
miembro(X, [T|_]) :- 
    is_list(T),
    miembro(X,T),
    !.

miembro(X, [_|R]) :- miembro(X, R).


lista_unicos([First|Rest], R) :-
    flatten([First|Rest], [F1|R1]),
    lista_unicos(F1, [], R1, R), !.

lista_unicos(X, Left, [Next|Rest], [X|W]) :-
    not(is_list(X)),
    is_unique(X, Left, [Next|Rest]),
    append(Left, [X], NewLeft),
    lista_unicos(Next, NewLeft, Rest, W).

lista_unicos(X, Left, [], [X|W]) :-
    not(is_list(X)),
    is_unique(X, Left, []),
    append(Left, [X], NewLeft),
    lista_unicos(Next, NewLeft, [], W).

lista_unicos(X, Left, [Next|Rest], W) :-
    not(is_list(X)),
    not(is_unique(X, Left, [Next|Rest])),
    append(Left, [X], NewLeft),
    lista_unicos(Next, NewLeft, Rest, W).

lista_unicos(,,[],[]) :- !.

is_unique(X, Left, Right) :-
    not(miembro(X, Left)),
    not(miembro(X, Right)).


mayores(N, arbol(Root, Izq, Der), [Root|W]) :-
    N < Root,
    mayores(N, Izq, I),
    mayores(N, Der, D),
    append(I,D, W),
    !.

mayores(N, arbol(Root, Izq, Der), W) :-
    N > Root,
    mayores(N, Izq, I),
    mayores(N, Der, D),
    append(I,D, W),
    !.

mayores(_, nil, []) :- !.

% 10
% Como auxiliar, la funcion insert, el cual inserta un nodo
% en un arbol binario segun su comparacion con el nodo raiz.
insert(R, nil, arbol(R, nil, nil)) :- !.
insert(R, arbol(R, SubLeft, SubRight), arbol(R, SubLeft, SubRight)):- !.
insert(R, arbol(N, SubLeft, SubRight), arbol(N, NewLeft, SubRight)) :-
  R < N, insert(R, SubLeft, NewLeft), !.
insert(R, arbol(N, SubLeft, SubRight), arbol(N, SubLeft, NewRight)) :-
  R > N, insert(R, SubRight, NewRight), !.

siembra(L, A):- siembra_aux(L, nil, A).
siembra_aux([], A, A) :- !.
siembra_aux([X|XS], Sub, A) :- insert(X, Sub, Sub2), siembra_aux(XS, Sub2, A).
