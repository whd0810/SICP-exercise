#lang racket

(define (f-rec n)
  (define (recurrence i r)
    (if (< i 3)
        (+ r i)
        (+ (recurrence (- i 1) r) (recurrence (- i 2) r) (recurrence (- i 3) r))))
  
  (recurrence n 0))

(define (f-iter n)
 ;; f1 = f(n), f2 = f(n - 1), f3 = f(n - 2)
  (define (iter i f1 f2 f3)
    (if (>= i n)
        f1
        (iter (+ i 1) (+ f1 f2 f3) f1 f2)))
  
  (if (< n 3)
      n
      (iter 2 2 1 0)))

(f-rec 7)
(f-iter 7)

