-module(main).
-export([suma/1]).

% Caso base si n es 0
% Caso genereal si n es mayor a 0
suma(0) -> -1;
suma (n) when n > 0 -> (n - 1 * 2) + suma (n - 1).