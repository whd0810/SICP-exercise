#lang racket

#|
序对是唯一确定的，所以"只用非负整数"表示序对等同与:
(a, b) <--> 2^a * 3^b 具有一一对应关系

证明 : 
1、 由定义可知与 (a, b) 对应的整数为 2^a * 3^b 是唯一确定的 
2、 假设与整数 n = 2^a*3^b 对应的序对有两个 (a1, b1)、 (a2, b2)
    其中 a1 != a2, b1 != b2，即:
    n = 2^a1 * 3^b1 = 2^a2 * 3^b2
    则: 2^(a1 - a2) = 3^(b2 - b1)  (等式 1), 
    但 (a1 - a2) != 0, (b2 - b1) != 0，等式 1 的左边为偶数右边为奇数这是不可能成立的，所以 a1 = a2, b1 = b2

综 1、 2 可得出 (a, b) <--> 2^a * 3^b 具有一一对应关系 

|#

(define (even? n)
 (= (remainder n 2) 0))

(define (square x) (* x x))

(define (fast-expt x n)
 (cond ((= n 0) 1)
  ((even? n) (square (fast-expt x (/ n 2))))
  (else (* x (fast-expt x (- n 1))))))

(define (cons a b) (* (fast-expt 2 a) (fast-expt 3 b)))

;; 计算 2 的次方 
(define (car n)
 (let ((r (remainder n 2)))
  (if (= r 0)
   (+ (car (/ n 2)) 1)
   0)))

;; 计算 3 的次方 
(define (cdr n)
 (let ((r (remainder n 3)))
  (if (= r 0)
   (+ (cdr (/ n 3)) 1)
   0)))

(define x (cons 2 1))
x
(car x)
(cdr x)

