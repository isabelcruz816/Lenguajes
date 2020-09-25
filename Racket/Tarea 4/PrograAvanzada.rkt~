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

(define (elimina-col n mat)
  (if
   (null? mat)
   '() 
   (cons (elimina-col-aux n (car mat)) (elimina-col n (cdr mat)))))

; Problema 2 a
; Rango de un bst
; Buscar min y max en una funcion auxiliar?
; (range '(8 '() '()))
(define (minVal root leftSubtree)
  (cond
    ((null? leftSubtree) root)
    ((null? (cadr leftSubtree)) root)
    ((list? (cadr leftSubtree)) (minVal (car leftSubtree) (cadr leftSubtree)))
    (else
     (if (< (car leftSubtree) root)
         (car leftSubtree)
         root))))

(define (maxVal root rightSubtree)
  (cond
    ((null? rightSubtree) root)
    ((null? (caddr rightSubtree)) root)
    ((list? (caddr rightSubtree)) (minVal (car (caddr rightSubtree)) (caddr (caddr rightSubtree))))
    (else
     (if (> (car rightSubtree) root)
         (car rightSubtree)
         root))))
    
(define (range bst)
  (cond
    ((null? bst) '())
    (cons (minVal (car bst) (cadr bst)) (maxVal (car bst) (caddr bst)))))

(define ABB '(8
              '(5 '(2 '() '()) '(7 '() '()))
              '(9 '() '(15 '(11 '() '())) '())))