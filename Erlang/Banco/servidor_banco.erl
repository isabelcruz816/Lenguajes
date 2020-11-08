-module(servidor_banco).
-export([inicio/0, servidor/1, deposita/3, busca/2]).

servidor(Datos) ->
    receive
        {De, {deposita, Quien, Cantidad}} ->
            De ! {servidor_banco, ok},
            servidor(deposita(Quien, Cantidad, Datos));
        {De, {consulta, Quien}} ->
            De ! {servidor_banco, busca(Quien, Datos)},
            servidor(Datos);
        {De, {retira, Quien, Cantidad}} ->
           case busca(Quien, Datos) of 
                indefinido ->
                    De ! {servidor_banco, no},
                    servidor(Datos);
                Saldo when Saldo > Cantidad ->
                    De ! {servidor_banco, ok},
                    servidor(deposita(Quien, -Cantidad, Datos));
                _ ->
                    De ! {servidor_banco, no},
                    servidor(Datos)
            end
    end.

inicio() ->
    register(servidor_banco, spawn(servidor_banco, servidor, [[]])).
    % se inicia la lista de clientes vacia

busca(Quien, [{Quien, Valor}|_]) ->
    Valor;
busca(Quien, [_|T]) ->
    busca(Quien, T); % Busca en el resto
busca(_, _) ->
    indefinido. % Si falla la busqueda

% Deposita nunca falle
deposita(Quien, X, [{Quien, Saldo} | T]) ->
    [{Quien, Saldo+X}|T];
deposita(Quien, X, [H|T]) ->
    [H|deposita(Quien, X, T)];
deposita (Quien, X, []) -> 
    [{Quien, X}].