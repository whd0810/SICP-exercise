#lang racket

(define (cont-frac n d k)
  (define (iterator i result)
    (if (<= i 0)
        result
        (iterator (- i 1) (/ (n i) (+ (d i) result)))))
  
  (iterator k 0))

(define (tan-ck x k)
  (cont-frac
   (lambda (i)
     (if (= i 1)
         x
         (- (* x x))))
   (lambda (i) (- (* 2.0 i) 1.0))
   k))

(tan-ck 1.0 10)
