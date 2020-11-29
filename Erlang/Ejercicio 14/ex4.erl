-module(ex4).
-export([sumas/3, sumas_aux/4, fuera/4, fuera_aux/4]).

sumas(I, N, S) ->
  sumas_aux(I, N, 1, S).

sumas_aux(Sum, 0, _, _) -> Sum;
sumas_aux(Sum, N, C, S) ->
  if (C =:= 4) -> 
      Sum,
      sumas_aux(Sum+S, N-1, C+1, S);
     true -> sumas_aux(Sum+S, N-1, C+1, S)
  end.

fuera_aux(S, E, N, L) ->
  if (N >= S), (N =< E) -> [N|L];
   true -> [L]
  end.
fuera(S, E, [X | XS]) ->
  case is_list(X) of
    true -> fuera(S, E, X)++fuera(S, E, XS);
    false -> fuera_aux(S, E, X, XS)
  end.


