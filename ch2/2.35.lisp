#lang racket

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (count-leaves t)
  (accumulate 
   (lambda (x y) (+ (cond ((null? x) 0)
                          ((not (pair? x)) 1)
                          (else (count-leaves x)))
                    y)) 
   0 
   (map 
    (lambda (x) x)
    t)))

(define tree (list 1 (list 2 3) (list 3 4)))

(count-leaves tree)

