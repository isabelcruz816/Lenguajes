#lang racket

; Registro --> (nomina nombre depto sueldo)

; Funciones de acceso para los registros
(define (obten-nomina registro) (car registro))
(define (obten-nombre registro) (cadr registro))
(define (obten-depto registro) (caddr registro))
(define (obten-sueldo registro) (cadddr registro))

; Nombre de los empleados del Depto x
(define (empleados nomina dept)
  (cond
    ((null? nomina) '())
    ((= dept (obten-depto (car nomina)))
     (cons (obten-nombre (car nomina)) (empleados (cdr nomina) dept)))
    (else (empleados (cdr nomina) depto))))
  

