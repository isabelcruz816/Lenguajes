#lang racket

; Problema 1 - Armonica
(define (armonica n)
  (if (= n 0)
      0
      (+ (/ 1 n) (armonica (- n 1)))
      ))

; Problema 2 - Bajasume
(define (bajasube n)
  (if (= n 0)
      ""
      (begin (print n)
             (if (= n 1)
                 (display "")
                 (display " "))
             (bajasube (- n 1))
             (display " ")
             (print n))))

; Problema 3 - Fibo
(define (fibo n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (true (+ (fibo (- n 1)) (fibo (- n 2))))))

; Problema 4 - Fibo Terminal
(define (fibo-aux n x y)
  (cond
    [(= n 0) x]
    [(= n 1) y]
    [else (fibo-aux(- n 1) y (+ x y))]))

(define (fibot n)
  (fibo-aux n 0 1))

