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
padre(ricardo, hector).
padre(ricardo, ricky).
padre(nancy, hector).
padre(nancy, ricky).
padre(ricardosr, ricardo).
padre(laurasr, ricardo).
padre(hectorsr, nancy)
padre(maria, nancy)
padre(ricardosr, carlos)
padre(laurasr, carlos)
padre(carlos, daniel)
padre(carlos, lucia)
padre(carlos, andrea)
padre(hilda, daniel)
padre(hilda, lucia)
padre(hilda, andrea)
padre(ricardosr, lety)
padre(laurasr, lety)
padre(lety, alex)
padre(lety, daniela)
padre(lety, juan)
padre(juancarlos, alex)
padre(juancarlos, daniela)
padre(juancarlos, juan)
padre(hectorsr, nora)
padre(maria, nora)
padre(nora, sergito)
padre(nora, pamela)
padre(sergio, sergito)
padre(sergio, pamela)

% Familia Ruben
padre(ruben, jorge).
padre(ruben, arely).
padre(jorge, edgar).
padre(jorge, said).
padre(arely, karla).

% Reglas
% X es hijo de Y si padre de X es Y
hijo(Hijo, Padre):-
    padre(Padre, Hijo).

hermano(Hermano1, Hermano2):-
    padre(X, Hermano1), padre(X, Hermano2),
    not(Hermano1 = Hermano2).

abuelo(Abuelo, Nieto):-
    padre(Abuelo, X), padre(X, Nieto).

nieto(Nieto, Abuelo):-
    abuelo(Abuelo, Nieto).

tio(Tio, Sobrino):-
    padre(X, Tio), abuelo(X, Sobrino).

sobrino(Sobrino, Tio):-
    tio(Tio, Sobrino).

primo(Primo1, Primo2) :- 
    padre(X, Primo1), padre(Y, Primo2),
    hermano(X, Y).