#lang racket
(require "common.rkt")

(define (spiral n (x 1) (distance 2))
  (cond
    [(>= x (* n n)) 0]
    [else (+
           (+ x (* 1 distance))
           (+ x (* 2 distance))
           (+ x (* 3 distance))
           (+ x (* 4 distance))
           (spiral n (+ x (* 4 distance)) (+ distance 2))
           )]
    )
  )

(add1 (spiral 1001))