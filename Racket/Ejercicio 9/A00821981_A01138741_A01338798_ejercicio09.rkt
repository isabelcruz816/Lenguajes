#lang racket
; Paola Villarreal A00821981
; Isabel Cruz A01138741
; Ruben Salazar A01338798

; PARTE 1

; Problema a
; Filtra
; Elimina los elementos de la lista que no cumplan con la condicion unaria
(define filtra
  (lambda (lista condicion)
    (cond
      [(null? lista) '()]
      [else
       (if ( condicion (car lista))
           (cons (car lista) (filtra (cdr lista) condicion))
           (filtra (cdr lista) condicion))
       ]
      )))
      
; Problema b
; Compon
; Aplica dos funciones pasadas por parametro a un valor x
(define compon
  (lambda (func1 func2)
    (lambda (x)
      (func1 (func2 x)))))

; Problema c
; Agrega Al Final
; Agrega al final de una lista el elemento e
(define agregaAlFinal
  (lambda (e)
    (lambda (l)
      (if (list? e)
        (append l e)
        (append l (list e))
      ))))

; PARTE 2
; Problema a
; Impares
; Elimina de una matriz los elementos que no son impares
(define (impares-aux lst)
  (if (null? lst)
      '()
      (if (odd? (car lst))
          (cons (car lst) (impares-aux (cdr lst)))
          (impares-aux (cdr lst)))))

(define (impares mat)
  (if (null? mat) '()
      (map (lambda (ren) (impares-aux ren)) mat)))

; Problema b
; Impares?
; Determina si hay elementos impares en una matriz
(define impares?
  (lambda (list)
    (if (> (apply + (map (lambda (line) (apply + line)) (map (lambda (line) (map (lambda (number) (remainder number 2)) line)) list))) 0)
       #t
       #f
    )))

; Problema c
; Empareja
; Genera una lista de pares que se pueden generan de una lista plana
(define (empareja lista)
  (apply append
          (map
           (lambda (x)
             (map
              (lambda (y) (append (list x)(list y)) )
              lista))
           lista)))

    
  