#lang racket
(require "common.rkt")
(require racket/set)

(define (amicable-nums-count max-num)
  (for/fold ([counter 0])
            ([i (in-range 1 max-num)]
             #:when (and
                     (not (= i (divisors-sum i)))
                     (= i (divisors-sum (divisors-sum i)))
                     )
             )
    (+ counter i))
  )

(amicable-nums-count 10001)