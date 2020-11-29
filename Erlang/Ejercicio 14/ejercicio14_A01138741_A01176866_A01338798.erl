
% A01138741 Ana Isabel Cruz Ramos
% A01176866 Héctor Díaz
% A01338798 Edgar Rubén Salazar Lugo 

-module(ejercicio14_A01138741_A01176866_A01338798).
-export([mayor/3,suma/1,negativos/1,filtra/2, impares/1]).
-m([lists, maps]).


% Ejercicio 1
mayor(N1, N2, N3) -> 
    if N1>=N1, N1>=N3 -> N1;
        N2>=N1, N2>=N3 -> N2;
        N3>=N1, N3>=N1 -> N3
    end.

% Ejercicio 2
suma(0) -> -1;
suma(N) -> (2*N-1) + suma(N - 1).


% Ejercicio 3
negativos([]) -> [];
negativos([Primero|Resto]) ->
    case Primero < 0 of
      true -> [Primero] ++ negativos(Resto);
      false -> negativos(Resto)
    end.


%Ejercicio 4
filtra(_, []) -> [];
filtra(Funcion, [Primero|Resto]) ->
    case Funcion(Primero) of
        true -> [Primero] ++ filtra(Funcion, Resto); 
        false -> filtra(Funcion, Resto)
    end.


%Ejercicio 5
impares(Lista) -> lists:map( fun(Row) -> lists:filter(fun(X) -> X rem 2 =/= 0 end, Row) end, Lista).


