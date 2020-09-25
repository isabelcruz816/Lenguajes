#lang racket

; Estructuras de datos
; Matrices
; Agregar un renglon a una matriz
(define (add-ren ren mat)
  (cond
    ((null? ren) mat)
    ((list? (car ren)) (add-ren (car ren) mat))
    (else (append (list ren) (list mat)))))

; Agregar columna a una matriz
(define (add-col mat col)
  (if
   (null? col) mat
   (if (null? mat)
       (cons (list (car col)) (add-col mat (cdr col)))
       (cons (append (car mat) (list (car col))) (add-col (cdr mat) (cdr col))))))
  
; Arboles
; Obtiene una lista de los nodo hojas
(define (hojas abb)
  (cond
    ((null? abb) '())
    ((and (null? (cadr abb)) (null? (caddr abb))) (list (car abb)))
    (else (append (hojas (cadr abb)) (hojas (caddr abb))))
  )
)

; Obtiene el minimo de un bst
(define (minVal root bst)
  (cond
    ((null? bst) root)
    (else
     (minVal (car bst) (cadr bst)))))

(define (min bst)
  (minVal (car bst) (cadr bst)))

; Grafos
; Contar las adyacencias de un grafo
(define (adyacencias-nodo lst)
  (cond
   ((null? lst) 0)
   ((= 1 (car lst)) (+ 1 (adyacencias-nodo (cdr lst))))
   (else (adyacencias-nodo (cdr lst)))))

(define (adyacencias-aux n g)
  (cond
    ((null? g) '())
    (else (cons (append (list n) (adyacencias-nodo (car g)))
                (adyacencias-aux (+ 1 n) (cdr g))))))

(define (adyacentes g)
  (cond
    ((null? g) '())
    (else (adyacencias-aux 1 g))))

; Pilas
(define (pop pila)
  (cdr pila))

(define (top pila)
  (car pila))

; Tablas
; Funciones de acceso para los registros
(define nomina
  '((1 (Juan) 2 1000)
    (1 (Isabel) 2 1000)))

(define (obten-nomina registro) (car registro))
(define (obten-nombre registro) (cadr registro))
(define (obten-depto registro) (caddr registro))
(define (obten-sueldo registro) (cadddr registro))

(define (empleados nomina dept)
  (cond
    ((null? nomina) '())
    ((= dept (obten-depto (car nomina)))
     (cons (obten-nombre (car nomina)) (empleados (cdr nomina) dept)))
    (else (empleados (cdr nomina) dept))))

; Recursividad plana
; Listas => atomicos, atomicos => lista, lista => lista
; Menor de una lista
(define (menor lst)
  (cond
    ((= 1 (length lst)) (car lst))
    ((< (car lst) (menor (cdr lst))) (car lst))
    (else (menor (cdr lst)))))

(define (nList num)
  (if (= -1 num)
      (list)
      (cons num (nList (- num 1)))))

(define (palindrome n)
  (append (reverse (nList n))(nList n)))

; Recursividad profunda
; Se manejan en bajo nivel, lista de listas
; Calcular la profundidad de una lista imbricada
(define (profundidad lst)
  (cond
    ((null? lst) 0)
    ((list? (car lst)) (+ 1 (profundidad (car lst))))
    (else (profundidad (cdr lst)))))

; Genera un palindromo con n niveles de anidamiento
(define (nuevaList n c)
  (if (= n c)
      (list)
      (list '<(nuevaList n (+ c 1))'>)))

(define (simetrico n)
   (nuevaList n 0))

; Recursividad Terminal
; El modulo no contiene operaciones adicionales a la llamada recursiva
; Fibonacci terminal
(define (fibo-aux n x y)
  (cond
    ((= n 0) x)
    ((= n 1) y)
    (else (fibo-aux (- n 1) y (+ x y)))))

(define (fibot n)
  (fibo-aux n 0 1))

; Factorial terminal
(define (fact-aux n r)
  (if (<= n 1) r
      (fact-aux (- n 1) (* n r))))

(define (factorial n)
  (fact-aux n 1))
    
; Lambda, Map, Apply
; Obtener sumatoria de los elementos de la matriz
(define (sumatoria mat)
  (cond
    ((null? mat) 0)
    (else (apply + (map (lambda (r) (apply + r)) mat)))))

; Determina si hay elementos impares en la matriz
(define (impares? mat)
  (cond
    ((null? mat) 0)
    (else
     (if (> (apply + (map (lambda (ren) (apply + (map (lambda (n) (remainder n 2)) ren))) mat)) 0) #t #f))))

(define (impares mat)
  (cond
    ((null? mat) '())
    (else
     (map (lambda (ren)
            (filter odd? ren)) mat))))