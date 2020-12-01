% Simulando un case
r(X):- X =:= 1, !, write(1).
r(X):- X =:= 2, !, write(2).
r(_):- write(3).

% Obtener el maximo de 3 elementos
maximo(X, Y, X):- X > Y, !.
maximo(_, Y, Y).