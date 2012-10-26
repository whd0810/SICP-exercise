#lang racket

(define (make-segment s e) (cons s e))

(define (start-segment x) (car x))

(define (end-segment x) (cdr x))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
 (display "(")
 (display (x-point p))
 (display ",")
 (display (y-point p))
 (display ")")
 (newline))

(define (midpoint-segment line)
 (let ((s (start-segment line))
       (e (end-segment line)))
  (make-point (/ (+ (x-point s) (x-point e)) 2.0)
                (/ (+ (y-point s) (y-point e)) 2.0))))

(define one-two (make-point 1 2))
(define two-five (make-point 2 5))
(define line (make-segment one-two two-five))
(print-point (midpoint-segment line))

