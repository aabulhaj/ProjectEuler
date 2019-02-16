#lang racket
(define (sum-square n)
  (if (> n 0) (+ (expt n 2) (sum-square (- n 1))) 0)
  )

(define (square-sum n)
  (expt
   (apply + (range 1 (+ n 1)))
   2)
  )

(- (square-sum 100) (sum-square 100))
