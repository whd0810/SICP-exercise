#lang racket

(define (equal? item1 item2)
 (cond ((and (null? item1) (not (null? item2))) false)
       ((and (not (null? item1)) (null? item2)) false)
       ((and (null? item1) (null? item2)) true)
       ((not (eq? (car item1) (car item2))) false)
       (else (equal? (cdr item1) (cdr item2)))))

(equal? '(this is a list) '(this is a list))

(equal? '(this is a list) '(this (is a) list))

