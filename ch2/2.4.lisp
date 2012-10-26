#lang racket

(define (cons x y)
 (lambda (m) (m x y)))

(define (car z)
 (z (lambda (p q) p)))

;; 证明 
(define f (lambda (p q) p))

(car (cons x y))
= ((cons x y) f)
= (lambda (m) (m x y) f)
= (f x y)
= ((lambda (p q) p) x y)
= x

;;
(define (cdr z)
 (z (lambda (p q) q)))

;; 证明 
(define f (lambda (p q) q))
(cdr (cons x y))
=((cons x y) f)
=(lambda (m) (m x y) f)
=(f x y)
=((lambda (p q) q) x y)
=y

