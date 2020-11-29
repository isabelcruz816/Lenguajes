%% EJERCICIO DE CLASE # 14: Programación Secuencial en Erlang
% Autor: Dr. Santiago Enrique Conant Pablos

-module(ej1).
-export([mayor/3, suma/1, negativos/1, filtra/2, impares/1, pruebas/0]).
   
% (1) Programar la función mayor en Erlang que reciba 3 argumentos numéricos y 
%     regrese el mayor.
mayor(A, B, C) ->
	if (A >= B) and (A >= C) -> A;
	   (B >= A) and (B >= C) -> B;
	   true -> C
	end.
	
% (2) Programar la función suma en Erlang que calcule la sumatoria:
%     ∑_(k=0)^n(2k-1)
suma(0) -> -1;
suma(N) when N > 0 -> (2 * N - 1) + suma(N - 1).
	
% (3) Programar la función recursiva negativos en Erlang que regrese una lista 
%     con los valores negativos de una lista de números.
negativos([]) -> [];
negativos([P|R]) -> if P < 0 -> [P | negativos(R)];
                       true -> negativos(R)
					end.
	
% (4) Programar la función de orden superior filtra en Erlang que trabaje igual 
%     que la FOS lists:filter (sin utilizarla).
filtra(_, []) -> [];
filtra(F, [P|R]) -> 
	case F(P) of
	   true -> [P | filtra(F, R)];
	   false -> filtra(F, R)
	end.

% (5) Programar la función impares que sin utilizar recursividad explícita 
%     elimine todos los elementos que no sean impares de una lista de sublistas.
impares(L) -> 
	lists:map(fun(Sublist) -> 
		lists:foldr(fun lists:append/2, [], odds(Sublist)) end, L).
odds(L) -> lists:map(fun(Num) -> if (Num rem 2) == 0 -> [];
                                    true -> [Num]
                                 end end, L).
                            								
% pruebas
pruebas() -> 
  io:format("::P1::~n~p~n~p~n~p~n::P2::~n~p~n~p~n::P3::~n~p~n~p~n~p~n::P4::~n~p~n~p~n::P5::~n~p~n~p~n",
     [mayor(7,-5,3),		% => 7
	  mayor(1,2,3),			% => 3
	  mayor(9,9,9),			% => 9
	  suma(0),				% => -1
	  suma(3),				% => -1+1+3+5 = 8
	  negativos([3,3,3]),			% => []
	  negativos([2,-3,4,-5]),		% => [-3,-5]
	  negativos([-9,-2,5,3,-2]),	% => [-9,-2,-2]
	  filtra(fun(X) -> X > 1 end, [-1,2,-3]),		% => [2]
	  filtra(fun(X) -> X < 0 end, [-1,2,-3]),		% => [-1,-3]
	  impares([[1,2,3],[4,5,6]]),			% => [[1,3],[5]]
	  impares([[2,2],[2,2],[2,2]])]).		% =>[[],[],[]]
