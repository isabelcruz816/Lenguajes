#lang racket

; Determinar maximo numero de aristas en un grafo
(define (max-aristas grafo)
  (if (null? grafo)
      0
      (let ((num-primero (length (cdr (car grafo)))) ; numero de aristas del primero
            (max-resto (max-aristas (cdr grafo))))
        (if (> num-primero max-resto)
            num-primero
            max-resto))))

; Eiminar nodo
(define (test2 grafo nodo)
  (map
   (lambda (seccion) (if (eq? (car seccion) nodo)
                         (cdr grafo)
                         (append (list(car seccion)) (map (lambda (adyacente)
                                (if (eq? (car adyacente) nodo) (cdr (cdr adyacente)) adyacente )
                                ) (cdr seccion)) )
                         ))
   grafo))

 
(define g
  '((A (B 2) (D 10))
    (B (C 9) (E 5))
    (C (A 12) (D 6))
    (D (E 7))
    (E (C 3))
    ))