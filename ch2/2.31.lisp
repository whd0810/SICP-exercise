#lang racket

(define (square x) (* x x))

(define (tree-map proc t)
 (cond ((null? t) t)
       ((not (pair? t)) (proc t))
       (else (cons (tree-map proc (car t)) (tree-map proc (cdr t))))))

(define items (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree t) (tree-map square t))

(square-tree items)

