#lang racket

(define (clima temp)
  (cond
    ((<= temp 0) "congelado")
    ((and (> temp 0)(<= temp 10)) "helado")
    ((and (> temp 10)(<= temp 20)) "frio")
    ((and (> temp 20)(<= temp 30)) "normal")
    ((and (> temp 30)(<= temp 40)) "caliente")
    ((> temp 40) "hirviendo")))