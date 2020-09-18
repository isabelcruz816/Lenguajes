#lang racket
; Sumar dos matrices
(define (suma-matrices mat1 mat2)
  (if (null? mat1)
      '()
      (cons (suma-renglones (car mat1) (car mat2))
            (suma-matrices (cdr mat1) (cdr mat2)))))

; Sumar dos renglones
(define (suma-renglones ren1 ren2)
  (if (null? ren1)
      '()
      (cons (+ (car ren1) (car ren2)) (suma-renglones (cdr ren1) (cdr ren2)))))