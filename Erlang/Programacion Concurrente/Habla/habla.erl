-module(habla).
-export([inicio/0, di_algo/2]).

di_algo(_, 0) ->
    hecho;
di_algo(Que, Veces) ->
    io:format("~p~n", [Que]),
    di_algo(Que, Veces - 1).

inicio() ->
    spawn(habla, di_algo, [hola, 3]),
    spawn(habla, di_algo, [adios, 3]).