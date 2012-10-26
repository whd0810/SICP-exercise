#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (identify n) n)
(define (inc n) (+ n 1))

(sum identify 1 inc 10)
