#lang racket

(define (fast-mul a b)
  (define (even? n) (= (remainder n 2) 0))
  
  (define (double n) (* n 2))
  
  (define (halve n) (/ n 2))
  
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ (fast-mul a (- b 1)) a))))

(fast-mul 10 5)
