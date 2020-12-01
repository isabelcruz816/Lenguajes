poblacion(mx, 2000).
poblacion(usa, 3000).
poblacion(esp, 4000).
area(mx, 600).
area(usa, 800).
area(esp, 700).

densidad(Pais, D):-
  poblacion(Pais, P),
  area(Pais, A),
  D is P / A.
