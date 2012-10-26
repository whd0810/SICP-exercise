#lang racket

(define (square x) (* x x))

(define (square-tree x)
 (cond ((null? x) null)
       ((not (pair? x)) (square x))
       (else (cons (square-tree (car x))
                   (square-tree (cdr x))))))

(define (square-tree-2 x)
 (map (lambda (t)
       (if (pair? t)
        (square-tree-2 t)
        (square t)))
  x))

(define items (list 1 (list 2 (list 3 4) 5) (list 6 7)))

items

(square-tree items)
(square-tree-2 items)

