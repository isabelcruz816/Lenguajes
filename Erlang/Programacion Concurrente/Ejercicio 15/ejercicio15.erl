%% EJERCICIO DE CLASE # 15: Programación Concurrente en Erlang
% Autor: Dr. Santiago Enrique Conant Pablos

-module(conc).
-export([suma/0, prueba_suma/0,
         registra/1, prueba_registra/0,
		 estrella/3, proceso/1,
		 pruebas/0]).

% P1 - proceso que acumula valores mandados en mensajes
suma() -> suma(0).
suma(A) ->
    receive
        {suma, N, Pid} ->
	        S = A + N,
		    Pid ! {respuesta, S},
	  	    suma(S)
    end.
% prueba el proceso concurrente suma
prueba_suma() ->
    P = spawn(conc, suma, []),
    prueba_suma(5, P).
prueba_suma(N, P) when N > 0 ->
    P ! {suma, N, self()},
    receive
        {respuesta, S} ->
             io:format("Acumulado ~w~n", [S]),
             prueba_suma(N-1, P)
    end;
prueba_suma(_, _) ->
    io:format("Terminé mi trabajo~n").

% P2 - proceso que lleva el registro de nombres
registra(Nombres) ->
    receive
        {registra, Nombre} ->
	         M = lists:member(Nombre, Nombres),
	         if not M ->
                    registra(lists:append(Nombres,[Nombre]));
			    true -> 
			        registra(Nombres)
		     end;
        {busca, Nombre, Pid} ->
	         M = lists:member(Nombre, Nombres),
	         if M ->
		            Pid ! {encontrado, si};
		        true ->
			        Pid ! {encontrado, no}
		     end,
		     registra(Nombres);
	    {lista, Pid} ->
	         Pid ! {registrados, Nombres},
		     registra(Nombres)
	end.
% prueba el proceso concurrente registra
prueba_registra() ->
    P = spawn(conc, registra, [[]]),
    io:format("Registra a pedro~n"),
    P ! {registra, pedro},
    P ! {busca, pedro, self()},
    receive
        {encontrado, E} -> 
	        io:format("~w encontró a pedro~n", [E])
    end,
    P ! {busca, lupita, self()},
    receive
        {encontrado, E1} -> 
	        io:format("~w encontró a lupita~n", [E1])
    end,
    io:format("Registra a lupita~n"),
    P ! {registra, lupita},
    io:format("Registra a pedro~n"),
    P ! {registra, pedro},
    P ! {lista, self()},
    receive
        {registrados, L} ->
	        io:format("Nombres registrados = ~w~n", [L])
    end.
   
% P3 - proceso que manda un mensaje M veces en una red
%      de N procesos con forma de estrella.
estrella(N, M, Mensaje) -> 
    % crea lista de Pids de los N procesos
    Estrella = crea_procesos(N),
    manda_mensajes(M, Mensaje, Estrella),
    lists:foreach(fun(Pid) -> Pid ! termina end, Estrella).
   
% crea N procesos y regresa una lista con sus Pids
crea_procesos(0) -> [];
crea_procesos(N) when N > 0 ->
    lists:append(crea_procesos(N - 1),
                 [spawn(conc, proceso, [N])]).
				
% función a partir de la que se crean los procesos	
proceso(N) -> proceso(N, 0).
% Cm es el contador de mensajes recibidos
proceso(N, Cm) -> 	
    receive
        termina ->
	        io:format("Proceso ~w terminó~n", [N]);
        {mensaje, Mensaje, Pid} ->    
	        Nm = Cm + 1,
		    io:format("p: ~w – n: ~w – m: ~p~n", 
		              [N, Nm, Mensaje]),
		    Pid ! {recibido, N},
		    proceso(N, Nm)
	end.
	
% manda M mensajes en una configuración de estrella
manda_mensajes(M, Mensaje, Estrella) when M > 0 ->
    manda_un_mensaje(Mensaje, Estrella),
    manda_mensajes(M - 1, Mensaje, Estrella);
manda_mensajes(0, _, _) -> hecho.
% manda un mensaje a los procesos de una estrella
manda_un_mensaje(_, []) -> hecho;
manda_un_mensaje(Mensaje, [Pid|Resto]) ->
    Pid ! {mensaje, Mensaje, self()},
    receive
        {recibido, N} -> 
	        io:format("Contestó el proceso ~w~n", [N]),
		    manda_un_mensaje(Mensaje, Resto)
	end.

% pruebas
pruebas() ->
    io:format(">> Problema 1~n"),
    prueba_suma(),
    io:format("~n>> Problema 2~n"),
    prueba_registra(),
    io:format("~n>> Problema 3~n"),
    estrella(6, 3, "mi mensaje").
