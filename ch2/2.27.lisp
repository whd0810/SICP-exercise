#lang racket

(define (reverse items)
 (define (iter i r)
  (if (null? i)
   r
   (iter (cdr i) (cons (car i) r))))

 (iter items null))

(define (deep-reverse items)
 (define (iter i r)
  (if (not (pair? i))
   (cons i r)
   (iter (cdr i) (cons (reverse (car i)) r))))

 (iter (reverse items) null))

(define items (list (list 1 2) 3 4))

(reverse items)
(deep-reverse items)

