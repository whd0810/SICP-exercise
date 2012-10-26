#lang racket

(define (fringe t)
 (define (dfs i r)
  (cond ((null? i) r)
        ((not (pair? i)) (cons i r))
        (else (dfs (car i) (dfs (cdr i) r)))))
 (dfs t null))

(define x (list (list 1 2) (list 3 4)))

(fringe x)

(fringe (list x x))

