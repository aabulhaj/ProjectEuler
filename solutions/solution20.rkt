#lang racket
(require "common.rkt")

(define (fact x)
  (cond
    [(= 0 x) 1]
    [else (* x (fact (sub1 x)))]
    )
  )

(define fact-100 (fact 100))

(apply + (num-to-digits fact-100))