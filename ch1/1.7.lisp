#lang racket

(define delta 0.001)

(define (good-enough? guess next)
  (< (/ (abs (- guess next)) guess) delta))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (define next (improve guess x))
  (cond ((good-enough? guess next) next)
        (else (sqrt-iter next x))))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2.0)
