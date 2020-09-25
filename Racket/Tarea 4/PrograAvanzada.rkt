#lang racket

; Tarea 4
; Hector, Rubén, Isabel

; Problema 1 inciso a
; Elimina columna
; (elimina-columna 3 ‘((4 0 3 1)(5 1 2 1)(6 0 1 1)))
; ‘((4 0 1)(5 1 1)(6 0 1)))
; Caso base: borrar la primera columna?
; Caso general: borrar una columna que no sea la primera
(define (elimina-col-aux n row)
  (if (null? row)
      '()
      (if (= n 1)
          (elimina-col-aux (- n 1) (cdr row))
          (cons (car row) (elimina-col-aux (- n 1) (cdr row))))))

(define (elimina-columna n mat)
  (if
   (null? mat)
   '() 
   (cons (elimina-col-aux n (car mat)) (elimina-columna n (cdr mat)))))

; Problema 2 a
; Rango de un bst
; Buscar min y max en una funcion auxiliar?
; (rango '(8 () ()))
; (rango '(8 (5 () ()) (10 () ())))
(define (minVal root leftSubtree)
  (cond
    ((null? leftSubtree) root)
    (else
     (minVal (car leftSubtree) (cadr leftSubtree)))))

(define (maxVal root rightSubtree)
  (cond
    ((null? rightSubtree) root)
    (else
     (maxVal (car rightSubtree) (caddr rightSubtree)))))

(define (rango abb)
  (cons (minVal (car abb) (cadr abb)) (maxVal (car abb) (caddr abb))))

