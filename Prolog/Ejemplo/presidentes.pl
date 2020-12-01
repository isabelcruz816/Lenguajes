goberno(epn, 2012, 2018).
goberno(fch, 2006, 2012).
goberno(vfq, 2000, 2006).
goberno(ezq, 1994, 2000).
goberno(csg, 1988, 1994).
goberno(mmh, 1982, 1988).
goberno(jlp, 1976, 1982).
goberno(lea, 1970, 1976).

% Predicado
fue_presidente(Persona, Anio):-
  goberno(Persona, Inicio, Fin),
  Anio >= Inicio, Anio =< Fin.

% Simulando Mecanismos de Control
mostrar :-
  goberno(P, _, _),
  write(P), nl,
  fail.
mostrar.