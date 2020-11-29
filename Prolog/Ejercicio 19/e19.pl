% Problema 4
% Cuenta los nodos hoja de un arbol binario con la estructura arbol(Raíz, SubárbolIzquierdo, SubárbolDerecho).

% Caso Base 1: El arbol vacio
hojas(nil, 0).

% Caso Base 2: Es un nodo hoja
hojas(arbol(_, nil, nil), 1).

% Caso General
hojas(arbol(_, SubIzq, SubDerecho), Hojas) :-
    !, hojas(SubIzq, I),
    hojas(SubDerecho, D),
    Hojas is I + D.