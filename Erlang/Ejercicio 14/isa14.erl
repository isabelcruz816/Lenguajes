-module(isa14).
-export([mayor/3, suma/1, negativos/1, filtra/2, impares/1]).

mayor(N1, N2, N3) ->
  if (N1 >= N2), (N1 >= N3) -> N1;
      (N2 >= N1), (N2 >= N3) -> N2;
      true -> N3
  end.

% Sumatoria
suma(0) -> -1;
suma(N) -> (2 * N - 1) + suma(N - 1).

negativos([]) -> [];
negativos([X | XS]) ->
 if X < 0 -> [X | negativos(XS)];
    true -> negativos(XS)
  end.

filtra(_, []) -> [];
filtra(Func, [X | XS]) ->
    case Func(X) of
      true -> [X | filtra(Func, XS)];
      false -> filtra(Func, XS)
    end.

impares(Lista) ->
  lists:map(fun(Row) -> lists:filter(fun(X) -> X rem 2 =/= 0 end, Row) 
        end, Lista).
