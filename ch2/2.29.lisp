#lang racket

(define (make-mobile left right)
 (list left right))

(define (make-branch length structure)
 (list length structure))

(define (left-branch t) (car t))
(define (right-branch t) (cdr t))

(define (leaf? t) (not (pair? (car t))))
(define (leaf-weight l) (car (cdr l)))
(define (leaf-force l) (* (car l) (car (cdr l))))

(define (total-weight t)
 (define (iter items w)
  (cond ((null? items) w)
        ((leaf? items) (+ w (leaf-weight items)))
        (else (iter (left-branch items)
                (+ w (iter (right-branch items) w))))))
 (iter t 0))

(define (balance? t)
 (define (moment-of-force items w)
  (cond ((null? items) w)
        ((leaf? items) (+ w (leaf-force items)))
        (else (moment-of-force (left-branch items)
               (+ w (moment-of-force (right-branch items) w))))))

 (= (moment-of-force (left-branch t) 0)
    (moment-of-force (right-branch t) 0)))


(define l1 (make-branch 2 3))
(define r1 (make-branch 3 2))
(define t1 (make-mobile l1 r1))

(total-weight t1)
(if (balance? t1)
 (display "balance")
 (display "not balance"))
(newline)

;; d
#|
改动比较打，需要修改 :
left-branch right-branch leaf? leaf-weight leaf-force
这几个函数 
|#

