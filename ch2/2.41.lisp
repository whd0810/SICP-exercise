#lang racket

;; 枚举所有的数对 (i j),然后再判断 k (k = s - i - j) 是否满足 :
;; k < j && k > 0 

(define (equal-sum-3 n s)
 (define (impl i j r)
  (if (and (<= i 2) (<= j 1))
   r
   (if (= j 1)
    (impl (- i 1) (- i 2) r)
     (impl i (- j 1) 
      (let ((k (- s i j)))
       (if (and (< k j) (> k 0))
        (cons (list i j k) r)
        r))))))
 
 (impl n (- n 1) null))

(equal-sum-3 5 9)

