empleado(juan, 22, e1).
empleado(pedro, 19, e2).
empleado(rosa, 22, e3).
estudiante(rosa, informatica).
estudiante(alberto, farmacia).
estudiante_trabajador(x):-
    estudiante(X, Y), empleado(X, Z, W).
