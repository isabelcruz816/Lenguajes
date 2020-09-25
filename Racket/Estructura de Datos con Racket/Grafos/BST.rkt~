#lang racket

; Find value in BST
(define (find bst value)
  (cond ((null? bst) #f)
        ((eq? value (car bst)) #t)
        ((< value (car bst)) (find (cadr bst) value))
        (else (find (caddr bst) value))))

