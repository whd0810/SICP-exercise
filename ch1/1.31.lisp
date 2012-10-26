#lang racket

(define (product-recursion term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursion term (next a) next b))))

(define (product-iterator term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (pi-calc n)
  (define (inc x) (+ x 1))
  
  (define (term x)
    (if (even? x)
        (/ (+ x 2.0) (+ x 1.0))
        (/ (+ x 1.0) (+ x 2.0))))
  
  ;; (product-recursion term 1 inc n))
  (product-iterator term 1 inc n))

(* 4 (pi-calc 10))
(* 4 (pi-calc 100))
(* 4 (pi-calc 1000))
(* 4 (pi-calc 100000))
