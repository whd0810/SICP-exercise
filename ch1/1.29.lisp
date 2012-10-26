#lang racket

(define (simpson f a b n)
  
  (define (sum f a b k n h)
    (let ((yk (f (+ a (* k h)))))
      (cond ((= k n) yk)
            ((= k 0) (+ yk (sum f a b (+ k 1) n h)))
            ((even? k) (+ (* 2 yk) (sum f a b (+ k 1) n h)))
            (else (+ (* 4 yk) (sum f a b (+ k 1) n h))))))
  
  (let ((h (/ (- b a) n)))
    (* (/ h 3.0) (sum f a b 0 n h))))

(define (cube x) (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
