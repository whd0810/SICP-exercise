#lang racket

#|
(p q) (a b)
=(pa + qa + qb, qa + pb)

(p q) (pa + qa + qb, qa + pb)
= (p*(pa + qa + qb) + q*(pa + qa + qb) + q*(qa + pb),
        q*(pa + qa + qb) + p*(qa + pb))
=(p^2*a + pqa + pqb + pqa + q^2*a + q^2*b + q^2*a + pqb,
        pqa + q^2*a + q^2*b + pqa + p^2*b)
=((p^2 + q^2)*a + (2pq + q^2)*a + (q^2 + 2pq)*b,
        (2pq + q^2)*a + (q^2 + p^2)*b)

(p q)^2*(a b)
= (p q) * ((p q) * (a b))
= (p q) * (pa + qa + qb, qa + pb)
=((p^2 + q^2)*a + (2pq + q^2)*a + (q^2 + 2pq)*b,
        (2pq + q^2)*a + (q^2 + p^2)*b)
= (p'a + q'a + q'b, q'a + p'b)
= (p' q')*(a b)
其中: p' = p^2 + q^2, q = 2pq + q^2
|#

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (define (even? n) (= (remainder n 2) 0))
  (define (square x) (* x x))
  
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
