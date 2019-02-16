#lang racket
(require "common.rkt")

(define (triangle_num x) (/ (* x (add1 x)) 2))

; n, n+1 are coprime, thus they have no common prime factors.
(define (triangle_numbers (n 1))
  (define fact_count
    (if (= (modulo n 2) 0)
        (* (factors_count (/ n 2)) (factors_count (add1 n)))
        (* (factors_count n) (factors_count (/ (add1 n) 2)))))
  (if (>= fact_count 500)
      (triangle_num n)
      (triangle_numbers (add1 n)))
  )

(triangle_numbers)