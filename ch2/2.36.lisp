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

(define seqs (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 seqs)


