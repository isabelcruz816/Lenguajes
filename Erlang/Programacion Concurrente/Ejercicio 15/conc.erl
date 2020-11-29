-module(conc).
-export([suma/0, registra/1, prueba_suma/0, misterio/2, examen/1]).

suma() -> suma(0).
suma(A) -> 
  receive
    {suma, N, Pid} ->
      S = A + N,
      Pid ! {respuesta, S},
      suma(S)
  end.

% Probar el proceso concurrente
prueba_suma() ->
  P = spawn(conc, suma, []),
  prueba_suma(5, P).
prueba_suma(N, P)  when N > 0 ->
  P ! {suma, N, self()},
  receive
    {respuesta, S} ->
      io:format("Acumulado ~w~n", [S]),
      prueba_suma(N-1, P)
  end;
prueba_suma(_,_) ->
  io:format("Termina~n").


% Problema 2
registra(Nombres) ->
  receive
    {registra, Nombre} ->
      M = lists:member(Nombre, Nombres),
      if not M ->
        registra(lists:append(Nombres, [Nombre]));
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

% Prueba registra

misterio(N, L) ->
     if  N == 0 -> [];
          true ->  [3+hd(L) | misterio(N-1,tl(L))]

    end.

 examen(Lista) -> lists:map(fun(X) -> [1,X] end, Lista).