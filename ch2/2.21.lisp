#lang racket

(define (square x) (* x x))

(define (square-list items)
 (if (null? items)
  null
  (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-2 items)
 (map (lambda (x) (* x x)) items))

(define list1 (list 1 2 3 4 5))

(square-list list1)
(square-list-2 list1)
