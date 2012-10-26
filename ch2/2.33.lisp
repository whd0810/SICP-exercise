#lang racket

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (map p seq)
  (accumulate (lambda (x y) (cons x y)) null seq))

(define (square x) (* x x))
(map square (list 1 2 3 4))

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(define seq1 (list 1 2 3))
(define seq2 (list 2 3 4))
(append seq1 seq2)

(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(length (list 1 (list 2 3) 4))

