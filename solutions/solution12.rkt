#lang racket
(require "common.rkt")

(define (triangle-num x) (/ (* x (add1 x)) 2))

; n, n+1 are coprime, thus they have no common prime factors.
(define (triangle-numbers (n 1))
  (define fact-count
    (if (= (modulo n 2) 0)
        (* (factors-count (/ n 2)) (factors-count (add1 n)))
        (* (factors-count n) (factors-count (/ (add1 n) 2)))))
  (if (>= fact-count 500)
      (triangle-num n)
      (triangle-numbers (add1 n)))
  )

(triangle-numbers)
