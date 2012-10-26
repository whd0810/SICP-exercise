#lang racket

(define (perimeter-rect r)
 (* (+ (long-rect r) (wide-rect r)) 2))

(define (area-rect r)
 (* (long-rect r) (wide-rect r)))

(define (make-rect tc lc) (cons tc lc))

;; 左上角、右下角 表示法 
(define (left-top r) (car r))
(define (rigth-buttom r) (cdr r))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (long-rect r)
 (- (x-point (rigth-buttom r)) (x-point (left-top r))))

(define (wide-rect r)
 (- (y-point (left-top r)) (y-point (rigth-buttom r))))

;; 长、宽表示法 
;; 形式都一样，只是为了在同一文件里编写而写成不同的名字 
(define (perimeter-rect-lw r)
 (* (+ (long-rect-lw r) (wide-rect-lw r) 2)))

(define (area-rect-lw r)
 (* (long-rect-lw r) (wide-rect-lw r)))

(define (make-rect-lw l w) (cons l w))

(define (long-rect-lw r) (car r))
(define (wide-rect-lw r) (cdr r))

;; 例子
(define lt (make-point 1 2))
(define rb (make-point 2 1))
(define rect (make-rect lt rb))

(perimeter-rect rect)
(area-rect rect)

(define l 1)
(define w 1)

(define rect-lw (make-rect-lw l w))
(perimeter-rect-lw rect-lw)
(area-rect-lw rect-lw)


