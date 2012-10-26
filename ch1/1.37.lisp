#lang racket

(define (cont-frac-recursion n d k)
  (define (recursion i k)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (recursion (+ i 1) k)))))
  
  (recursion 1 k))

(define (cont-frac-iterator n d k)
  (define (iterator i result)
    (if (<= i 0)
        result
        (iterator (- i 1) (/ (n i) (+ (d i) result)))))
  
  (iterator k 0))

(cont-frac-recursion (lambda (i) 1.0) (lambda (i) 1.0) 1000)
(cont-frac-iterator (lambda (i) 1.0) (lambda (i) 1.0) 1000)
