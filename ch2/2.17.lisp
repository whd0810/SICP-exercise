#lang racket

(define (last-pair l)
 (define (last-pair-iter cur pre)
  (if (null? cur)
   pre
   (last-pair-iter (cdr cur) cur)))
 (last-pair-iter l l))

(define list1 (list 23 72 149 34))
(define list2 (list 23))

(last-pair list1)
(last-pair list2)

