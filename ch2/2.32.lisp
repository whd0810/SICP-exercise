#lang racket

#|
集合 : {a1, a2, ..., an} 的所有集合的子集集合为 A
所有子集的集合分为：含有元素 a1 的集合 + 不含有元素 a1 的集合
|#

(define (subsets s)
 (if (null? s)
  (list null)
  (let ((rest (subsets (cdr s))))
   (append rest (map (lambda (x) (append (list (car s)) x)) rest)))))

(define s (list 1 2 3))
(subsets s)

