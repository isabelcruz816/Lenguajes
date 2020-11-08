-module(cliente_banco).
-export([consulta/1, deposita/2, retira/2]).

% Nombre largo del servidor (nombre@maquina)
matriz() -> 'servidor@BAN280'.

% Funciones de interface
consulta(Quien) ->
    llama_banco({consulta, Quien}).
deposita(Quien, Cantidad) ->
    llama_banco({deposita, Quien, Cantidad}).
retira(Quien, Cantidad) ->
    llama_banco({retira, Quien, Cantidad}).

llama_banco(Mensaje) ->
    Matriz = matriz(),
    monitor_node(Matriz, true), % Revisar que no se caiga el nodo
    {servidor_banco, Matriz} ! {self(), Mensaje}, % mensaje al servidor, segun la funcion de interface
    receive
        {servidor_banco, Respuesta} ->
            monitor_node(Matriz, false),
            Respuesta;
        {nodedown, Matriz} ->
            no
    end.