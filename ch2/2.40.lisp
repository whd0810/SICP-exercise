#lang racket

(define (pairs-n n)
  (define (impl i)
    (if (= i n)
        null
        (cons (list n i) (impl (+ i 1)))))
  (impl 1))

(define (unique-pairs n)
  (if (= n 1)
      null
      (append (unique-pairs (- n 1)) (pairs-n n))))

(define (unique-pairs-2 n)
  (define (impl i j r)
    (if (and (<= i 1) (<= j 1))
        r
        (if (= j 0)
            (impl (- i 1) (- i 2) r)
            (impl i (- j 1) (cons (list i j) r)))))
  
  (impl n (- n 1) null))

(pairs-n 5)
(unique-pairs 5)
(unique-pairs-2 5)

