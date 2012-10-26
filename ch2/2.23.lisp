#lang racket

(define (for-each proc items)
 (if (null? items)
  void
  (begin (proc (car items))
   (for-each proc (cdr items)))))

(define list1 (list 1 2 3 4 5))
(for-each (lambda (x) (begin (newline) (display x))) list1)


