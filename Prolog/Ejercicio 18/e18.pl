% P2: fgeneral
% fgeneral(1,-5,6,X1,X2) => X1 = 3.0, X2 = 2.0
fgeneral(A, B, C, X1, X2) :-
  D is B^2 - 4*A*C,
  D >= 0,
  X1 is (-B + sqrt(D)) / (2*A),
  X2 is (-B - sqrt(D)) / (2*A), !.
fgeneral(A, B, C, img, img) :-
  D is B^2 - 4*A*C,
  D < 0, !.

% P3: Armonica
armonica(1, 1).
armonica(N, R) :-
  N > 1,
  PN is N - 1,
  armonica(PN, PR),
  R is PR + 1 / N.

% Fibonacci
fibo(1, 1).
fibo(2, 1).
fibo(N, F) :-
  N > 2,
  PN is N - 1,
  fibo(PN, PF),
  SN is N - 2,
  fibo(SN, SF),
  F is PF + SF.