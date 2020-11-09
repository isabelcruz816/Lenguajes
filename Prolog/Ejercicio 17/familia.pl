% Hechos

% Familia Isabel
padre(adrian, isabel). % isabel is hija de adrian
padre(bertha, isabel).
padre(adrian, adrianjr).
padre(bertha, adrianjr).
padre(adrian, pablo).
padre(bertha, pablo).
padre(maria, adrian).
padre(elias, adrian).
padre(gilberto, bertha).
padre(ana, bertha).
padre(gilberto, ricardo).
padre(ana, ricardo).
padre(gilberto, nancy).
padre(ana, tere).
padre(gilberto, tere).
padre(ana, nancy).
padre(ricardo, roberto).
padre(ricardo, ricardojr).
padre(ricardo, pamela).
padre(nancy, nancyjr).
padre(nancy, nacho).
padre(saul, nancyjr).
padre(saul, nacho).
padre(tere, hanna).
padre(tere, luis).
padre(gerardo, hanna).
padre(gerardo, hanna).

% Familia Hector

% Familia Ruben

% Reglas
% X es hijo de Y si padre de X es Y
hijo(Hijo, Padre):-
    padre(Padre, Hijo).

hermano(Hermano1, Hermano2):-
    padre(X, Hermano1), padre(X, Hermano2),
    hijo(Hermano1, X), hijo(Hermano2, X),
    not(Hermano1 = Hermano2).

abuelo(Abuelo, Nieto):-
    padre(Abuelo, X), padre(X, Nieto).

nieto(Nieto, Abuelo):-
    abuelo(Abuelo, Nieto).

tio(Tio, Sobrino):-
    padre(X, Tio), abuelo(X, Sobrino).

sobrino(Sobrino, Tio):-
    tio(Tio, Sobrino).

primo(Primo1, Primo2):-
    padre(X, Primo1), tio(X, Primo2);
    padre(X, Primo2), tio(X, Primo1).