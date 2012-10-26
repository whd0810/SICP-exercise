#lang racket

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff
                   (* x (cond ((null? higher-terms) 0)
                              ((not (pair? higher-terms)) higher-terms)
                              (else (horner-eval x higher-terms))))))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))

