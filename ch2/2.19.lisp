#lang racket

(define (cc amount coin-values)
 (cond ((= amount 0) 1)
       ((or (< amount 0) (no-more? coin-values)) 0)
       (else
        (+ (cc amount (except-first-denomination coin-values))
           (cc (- amount (first-denomination coin-values)) coin-values)))))

(define (no-more? l) (null? l))
(define (except-first-denomination l) (cdr l))
(define (first-denomination l) (car l))

(define us-coins (list 50 25 10 5 1))
(define us-coins-1 (list 25 50 5 10 1))

(cc 100 us-coins)
(cc 100 us-coins-1)

;; 不会影响输出，因为算法与面值无关

