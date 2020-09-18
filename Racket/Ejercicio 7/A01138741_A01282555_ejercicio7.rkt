#lang racket
; Autores: A01138741 y A01282555


; Menor
(define (menor lista)
	(cond ((=(length lista) 1) (car lista))
		((< (car lista) (menor (cdr lista))) (car lista))
		(else (menor (cdr lista)))))

; Negativos
(define (negativos lista)
  (if (null? lista)
      '()
      (if (<(car lista) 0)
          (cons (car lista) (negativos (cdr lista)))
          (negativos(cdr lista))
          )))

; Palindrome n
(define (nList num)
  (if (= -1 num)
      (list)
      (cons num (nList (- num 1)))))

(define (palindrome n)
  (append (reverse (nList n))(nList n)))

; Profundidad
; caso base: lista atomica: 0
; caso general: lista con varias listas
(define (profundidad lista)
  (cond ((null? lista) 0)
        ((list? (car lista))
         (+ 1 (profundidad (car lista))))
        (else (profundidad (cdr lista)))))

; Simetrico
(define (simetrico-aux n c)
  (if (= n c)
      (list)
      (list'<(simetrico-aux n (+ c 1))'>)))

(define (simetrico n)
   (nList n 0))


; Elimina
; Caso base 1: la lista vacia
; Caso base 2: el primer elemento es igual al n
; Caso base 3: el primer elemento es una lista, hay que aplicar recursividad
; Caso general: no quites el primer elemento, solo usa la recursividad en el resto de la lista
(define (elimina n lista)
  (cond
    ((null? lista)
     '())
    ((equal? n (car lista))
     (elimina n (cdr lista)))
    ((list? (car lista))
     (cons (elimina n (car lista)) (elimina n (cdr lista))))
    (else(cons (car lista) (elimina n (cdr lista))))))
  
  
  

        
  

