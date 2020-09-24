#lang racket
; Tarea 3
; Autores:
;           Hector Diaz, A01176866
;           Isabel Cruz, A01138741
;           Edgar Ruben Salazar, A01338798

; Problema 1
; Funcion que regresa True si n es un numero primo
(define (primo? n)
  (cond
    ((= 0 n) #f)
    ((= 1 n) #f)
    (else (primo-aux n 2))))

(define (primo-aux n divisor)
  (cond 
  ((= n divisor) #t)
  ((= 0 (modulo n divisor)) #f)
  (else (primo-aux n (+ 1 divisor)))))

; Problema 2
; Funcion que regrsa la suma de los digitos pares de n
(define (sumdpar n)
  (cond
    ((< n 10) (cond ((= (modulo n 2) 0) n) (else 0)))
    ((= (modulo (modulo n 10) 2) 0) (+ (modulo n 10) (sumdpar (/ (- n (modulo n 10)) 10))))
    (else (sumdpar (/ (- n (modulo n 10)) 10)))))
  

; Problema 3
; Funcion que regresa el numero de combinaciones de la funcion C(n, r)
(define (combinaciones n r)
  (cond
    ((= r 0) 1)
    ((= r n) 1)
    (else
     (+ (combinaciones (- n 1) (- r 1)) (combinaciones (- n 1) r)))))

; Problema 4 - Respuesta en PDF

; Problema 5
; Funcion que calcula el OR logico entre bits dado como listas
(define (bitor lista1 lista2)
  (cond
    ((= (length lista1) 0) '())
    ((or (= (first lista1) 1) (= (first lista2))) (flatten (list '(1) (bitor (rest lista1) (rest lista2)))))
    (else
     (flatten (list '(0) (bitor (rest lista1) (rest lista2)))))))

; Problema 6
; Funcion que regresa el valor decimal de un numero binario dado como argumento
(define (hexadecimal b) ;convierto un número binario en un lista de 1's y 0's
  (b-h 
  (map (compose string->number string)
     (string->list (number->string b))) ))

(define (b-h b) ;método auxiliar para convertir de binario a hexadecimal
  (cond
    [(null? b) '()]
    [(<= (length b) 4) (list(hexa-value (decimal b) ))]
    [else (append
           (b-h (list-tail b 4))
           (list
            (hexa-value (decimal
                         (cons (list-ref b 0) (cons (list-ref b 1) (cons (list-ref b 2) (cons (list-ref b 3) '()))))
                         ) )
            )
           )
          ]
    )
  )

(define (hexa-value value) ;método que regresa el valor unitario
  (cond
    [(= value 10) 'a]
    [(= value 11) 'b]
    [(= value 12) 'c]
    [(= value 13) 'd]
    [(= value 14) 'e]
    [(= value 15) 'f]
    [else value]))


; Problema 7
; Funcion que regrersa el valor decimal de un numero binario dado como una lista
(define (decimal lista)
  (cond
    ((empty? lista) 0)
    (else
     (+ (* (first lista) (expt 2 (- (length lista) 1))) (decimal (rest lista))))))


; Problema 8
; Funcion que regrersa True si la lista dada como argumento es una expresion
; Funcion auxiliar que revisa el resto de la lista sean valores numericos despues de encontrar un op
(define (checkRest lista)
  (if (null? lista)
      #t
      (if (list? (car lista))
          (expression-aux (car lista))
          (if (number? (car lista))
              (checkRest (cdr lista))
              #f))))
; Funcion auxiliar que revisa que empecemos bien la expresion
(define (expression-aux lista)
  (if (null? lista)
      #t
      (if (< (length lista) 3)
          #f
          (if (number? (car lista))
              #f
              (checkRest (cdr lista))))))

(define (expresion? lista)
  (cond
    ((null? lista) #f)
    (else (expression-aux lista))))
         
; Problema 9
; Funcion que regresa el patron palindromo intercalando los simbolos a y b, n veces en sublistas
(define (palindromo n)
  (cond
    ((= n 1) '(a))
    ((= (modulo n 2) 0) (list 'b (palindromo (- n 1)) 'b))
    (else
     (list 'a (palindromo (- n 1)) 'a))))

; Problema 10
; Funcion que invierte una lista imbricada junto con todas sus listas
(define (inversiontotal lista)
  (cond
    [(null? lista) lista] 
    [(list? (car lista))
     (append
      (inversiontotal (cdr lista))
      (list (inversiontotal (car lista)))
      )]
    [else (append
           (inversiontotal (cdr lista))
           (list (car lista))
           )]
))

