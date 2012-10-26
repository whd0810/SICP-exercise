#lang racket

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init 
                        (map
                         (lambda (x) (cond ((null? x) null)
                                           ((not (pair? x)) x)
                                           (else (car x)))) seqs))
            (accumulate-n op init 
                          (map
                           (lambda (x) (cond ((or (null? x) (not (pair? x))) null)
                                             (else (cdr x)))) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(define m (list (list 1 2) (list 3 4)))
(define n (list (list 3 4) (list 1 2)))
(define v (list 2 4))
(define w (list 1 3))

(dot-product v w)
(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m n)


