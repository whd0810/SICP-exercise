#lang racket

(define (add-interval x y)
 (make-interval (+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
 (let ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))

(define (div-interval x y)
 (mul-interval x
               (make-interval (/ 1.0 (upper-bound y))
                              (/ 1.0 (lower-bound y)))))

;; 2.7
(define (make-interval a b) (cons a b))

(define (upper-bound x)
 (let ((a (car x))
       (b (cdr x)))
  (if (< a b)
   b
   a)))

(define (lower-bound x)
 (let ((a (car x))
       (b (cdr x)))
  (if (< a b)
   a
   b)))

;; 2.8
(define (len-interval x)
 (- (upper-bound x) (lower-bound x)))

(define (sub-interval x y)
 (if (< (len-interval x) (len-interval y))
  (make-interval (- (upper-bound y) (upper-bound x))
                 (- (lower-bound y) (lower-bound x)))
  (make-interval (- (upper-bound x) (upper-bound y))
                 (- (lower-bound x) (lower-bound y)))))

;; 2.9 证明很简单，略过 

;; 2.10 
#|
(define (div-interval x y)
 (if (or (< (upper-bound y) 0) (> (lower-bound y)))
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))
  (display "division exception")))
|#

;; 2.11
#|
;; 实际上有一种情况计算的次数超过 2 次，当 a1 < 0 < b1 a2 < 0 < b2 时需要 4 次乘法 

(define (mul-interval x y)
 (let ((a1 (lower-bound x))
       (b1 (upper-bound x))
       (a2 (lower-bound y))
       (b2 (upper-bound y)))
  (cond ((> a1 0)  ;; 0 < a1 < b1
         (cond ((> a2 0) (make-interval (* a1 a2) (* b1 b2))) ;; 0 < a2 < b2
               ((< b2 0) (make-interval (* b1 a2) (* a1 b2))) ;; a2 < b2 < 0
               (else (make-interval (* b1 a2) (* b1 b2)))))   ;; a2 <= 0 <= b2 
        ((< b1 0)  ;; a1 < b1 < 0
         (cond ((> a2 0) (make-interval (* a1 b2) (* a2 b1))) ;; 0 < a2 < b2
               ((< b2 0) (make-interval (* b1 b2) (* a2 b2))) ;; a2 < b2 < 0
               (else (make-interval (* a1 b2) (* a1 a2)))))   ;; a2 <= 0 <= b2
        (else     ;; a1 <= 0 <= b1
         (cond ((> a2 0) (make-interval (* a1 b2) (* b1 b2)))
               ((< b2 0) (make-interval (* b1 a2) (* a1 a2)))
               (else (make-interval (min (* a1 b2) (* a2 b1))
                                    (max (* a1 a2) (* b1 b2)))))))))

|#

;; 2.12
#|
;; a +- p%
(define (make-center-percent c p)
 (let ((w (* c p)))
  (make-interval (- c w) (+ c w))))

(define (percent i)
 (let ((c (/ (+ (upper-bound i) (lower-bound i)) 2.0))
       (w (/ (- (upper-bound i) (lower-bound i)) 2.0)))
  (* 100 (/ w c))))

|#

;; 2.13
#|
乘积后的百分比误差月等于 :
    p = (p1/c1 + p2 / c2) * 100

证明 :
假设两个区间为 : (c1 +- p1%) (c2 +- p2%)
根据乘法定义可得相乘后为 :
[c1*c2-c2*p1-c1*p2+p1*p2, c1*c2+c2*p1+p1*p2]
中心 :   c = c1*c2+p1*p2 = c1*c2 (p1*p2 很小，可以忽略)
宽度 :   w = c2*p1+c1*p2
百分比 : p = w / c * 100
           = (c2*p1+c1*p2)/(c1*c2) * 100
           = (p1/c1 + p2 / c2) * 100
           
|# 

;; 2.14 2.15 2.16 都是浮点运算精确度的问题 



