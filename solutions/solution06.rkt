#lang racket
(define (sum_square n)
  (if (> n 0) (+ (expt n 2) (sum_square (- n 1))) 0)
  )

(define (square_sum n)
  (expt
   (apply + (range 1 (+ n 1)))
   2)
  )

(- (square_sum 100) (sum_square 100))