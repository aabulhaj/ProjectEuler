#lang racket
(require "common.rkt")

(define (sum-of-digits i)
  (apply +
         (map
          (lambda (x) (expt x 5))
          (num-to-digits i)))
  )

(define (sum-of-fifth-power-digits)
  (apply +
         (for*/list ([i (in-range 6 295246)] ; 5 * 9^5
                     #:when (= i (sum-of-digits i))) 
           i)
         )
  )

(sum-of-fifth-power-digits)