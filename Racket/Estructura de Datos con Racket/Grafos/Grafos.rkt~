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