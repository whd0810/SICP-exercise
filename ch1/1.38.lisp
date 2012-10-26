#lang racket

(define (cont-frac n d k)
  (define (iterator i result)
    (if (<= i 0)
        result
        (iterator (- i 1) (/ (n i) (+ (d i) result)))))
  
  (iterator k 0))

(define (e-2 n)
  (cont-frac
   (lambda (i) 1.0)
   (lambda (i)
     (let ((r (remainder i 3)))
       (if (or (= r 0) (= r 1))
           1.0
           (* 2.0 (/ (+ i 1) 3)))))
   n))

(+ (e-2 10000) 2)
