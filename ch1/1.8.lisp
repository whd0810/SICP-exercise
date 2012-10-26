#lang racket

(define delta 0.001)

(define (square x) (* x x))

(define (good-enough? guess next)
  (< (/ (abs (- guess next)) guess) delta))

(define (improve y x)
 (/ (+ (/ x (square y)) (* 2 y)) 3)) 

(define (cube-root-iter guess x)
  (define next (improve guess x))
  (cond ((good-enough? guess next) next)
        (else (cube-root-iter next x))))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27.0)
