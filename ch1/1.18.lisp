#lang racket

(define (fast-mul a b)
  (define (even? n) (= (remainder n 2) 0))
  (define (double n) (* n 2))
  (define (halve n) (/ n 2))
  
  (define (iter x y i)
    (cond ((<= i 0) x)
          ((even? i) (iter x (double y) (halve i)))
          (else (iter (+ x y) y (- i 1)))))
  
  (iter 0 a b))

(fast-mul 10 5)
