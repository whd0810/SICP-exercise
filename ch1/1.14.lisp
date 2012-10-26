#lang racket

#|
f(b, n) = b^n, 如果 n 为偶数则 : f(b, n) = (b^2)^(n/2)，否则 f(b, n) = b * b^(n - 1)
以 2^7 为例:
迭代过程 a, b, n 的值的变化如下 :
1. a = 1, b = 2, n = 7
2. a = 2, b = 2, n = 6
3. a = 2, b = 4, n = 3
4. a = 2 * 4, b = 4, n = 2
5. a = 8, b = 16, n = 1
6. a = 8 * 16, b = 16, n = 0
|#

(define (fast-expt x n)
  (define (even? n) (= (remainder n 2) 0))
  
  (define (square x) (* x x))
  
  (define (iter a b i)
    (cond ((<= i 0) a)
          ((even? i) (iter a (square b) (/ i 2)))
          (else (iter (* a b) b (- i 1)))))
  
  (iter 1 x n))

(fast-expt 2 7)
