#lang racket
; Ordenar un arreglo en forma ascendente
(define (ordena arreglo)
  (if (null? arreglo)
      arreglo
      (inserta (car arreglo) (ordena (cdr arreglo)))))

; Insertar un elemenot en un arreglo ordenado
(define (inserta val arreglo)
  (cond
    ((null? arreglo) (list val))
    ((<= val (car arreglo))
     (cons val arreglo))
    (else (cons (car arreglo) (inserta val (cdr arreglo))))))

