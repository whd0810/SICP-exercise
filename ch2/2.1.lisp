#lang racket

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
 (display (numer x))
 (display "/")
 (display (denom x))
 (newline))
(define (abs x)
 (if (< x 0)
  (- x)
  x))

(define (sign-rat n d)
 (if (or (and (< n 0) (> d 0)) (and (> n 0) (< d 0)))
  -1
  1))

(define (gcd a b)
 (define (gcd-iter x y)
  (let ((r (remainder x y)))
   (if (= r 0)
    y
    (gcd-iter y r))))

 (cond ((= a 0) b)
  ((= b 0) a)
  (else (gcd-iter (abs a) (abs b)))))

(define (make-rat n d)
 (let ((g (gcd n d)))
  (cons (* (/ (abs n) g) (sign-rat n d)) (/ (abs d) g))))

(define (add-rat x y)
 (make-rat (+ (* (numer x) (denom y))
            (* (denom x) (numer y)))
           (* (denom x) (denom y))))

(define (sub-rat x y)
 (make-rat (- (* (numer x) (denom y))
            (* (denom x) (numer y)))
           (* (denom x) (denom y))))

(define (mul-rat x y)
 (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
 (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define two-five (make-rat 1 5))
(define one-third (make-rat 1 (- 20)))

(print-rat (add-rat two-five one-third))
(print-rat (sub-rat two-five one-third))
(print-rat (mul-rat two-five one-third))
(print-rat (div-rat two-five one-third))

