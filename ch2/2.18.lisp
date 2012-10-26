#lang racket

(define (reverse l)
 (define (reverse-iter l r)
  (if (null? l)
   r
   (reverse-iter (cdr l) (cons (car l) r))))

 (reverse-iter l '()))

(define list1 (list 1 4 9 16 25))
(define list2 (list 1 4))
(define list3 (list 1))

(reverse list1)
(reverse list2)
(reverse list3)
