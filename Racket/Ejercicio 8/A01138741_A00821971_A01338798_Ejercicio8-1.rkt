; Ejercicio 8

; Paola Villarreal A00821971
; Isabel Cruz A01138741
; Ruben Salazar A01338798

#lang racket

; Problema 1
; Agrega un renglon a lista
(define (add-ren mat ren)
   (cond
     ((null? ren) mat)
     ((list? (car ren)) (add-ren mat (car ren)))
     (else (append mat (list ren)))))
     
;Problema 2
; Agrega una columna a la lista
; Test (add-col '((1)(2)) '(3 4)) => '((1 3) (2 4))
; 2 casos - col vacia o no
; SI no esta vacia, otros dos casos, mat vacia o no vacia
(define (add-col mat col)
  (if
   (null? col)
   mat
   (cond
     ((null? mat) (cons (append mat (car col)) (append mat (cdr col))))
     (else (cons (append (car mat) (list (car col))) (add-col (cdr mat) (cdr col)))))))

  
;Problema 3
(define (hojas abb)
  (cond
    ((null? abb) (list))
    ((and (null? (cadr abb)) (null? (caddr abb))) (list (car abb)))
    (else (append (hojas (cadr abb)) (hojas (caddr abb))))
  )
)


;Problema 4
(define (adyacentes grafo)
  (aux-ady grafo 1))

(define (aux-ady grafo n) ;metodo auxiliar que ayuda a contar añadir el numero del nodo
  (cond
    [(null? grafo) '()]
    [else (
           cons 
           (cons n (cons (cuenta-unos (car grafo)) '()))
           (aux-ady (cdr grafo) (+ n 1))     
           )  ]
    ))
  

(define (cuenta-unos lista) ;metodo que cuenta la cantidad de adycencias en un nodo
  (cond
    [(null? lista) 0]
    [(= (car lista) 1) (+ 1 (cuenta-unos(cdr lista)))]
    [else (+ 0 (cuenta-unos(cdr lista)))]
    )
  )

