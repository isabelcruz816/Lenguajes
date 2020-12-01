% Funcion de Factorial
factorial(0, 1).

factorial(N, R):-
  X is N - 1,
  factorial(X, W),
  R is N * W.

% Operador de multiplicacion
producto(0, X, 0).

producto(X, Y, Z):-
  X > 0,
  N is X - 1,
  producto(N, Y, W),
  Z is W + Y.