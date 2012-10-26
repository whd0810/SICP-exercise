#lang racket

(define (binomial n)
  (define (add-2 l)
    (if (null? (cdr l))
        (car l)
        (+ (car l) (cadr l))))

  ;; 由上一列计算下一列的值 
  (define (calc-next i j pre-result cur-result)
    (if (>= i j)
        cur-result
        (calc-next (+ i 1) j 
                   (cdr pre-result) 
                   (cons (add-2 pre-result) cur-result))))
 
  ;; 从 1 迭代到 n
  (define (iter-n i pre-result)
    (cond ((> i n) void)
          (else
           (let ((cur-result (calc-next 0 i pre-result (list 1))))
             (display cur-result)
             (newline)
             (iter-n (+ i 1) cur-result)))))
  
  (display (list 1))
  (newline)
  (iter-n 1 (list 1)))

(binomial 5)
