#lang racket

(define (same-parity x . z)
  (define (same? n1 n2)
    (= (remainder n1 2) (remainder n2 2)))
  
  (define (same-parity-iter a b)
    (cond ((null? b) null)
          ((same? a (car b)) (cons (car b) (same-parity-iter a (cdr b))))
          (else (same-parity-iter a (cdr b)))))
  
  (same-parity-iter x (cons x z)))

(same-parity 2 3 4 5 6 7)

