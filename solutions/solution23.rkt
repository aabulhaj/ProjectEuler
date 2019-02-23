#lang racket
(require "common.rkt")

(define (abundant-nums n max)
  (for/list ([i (in-range n (add1 max))]
             #:when (> (divisors-sum i) i))
    i
    )
  )

(define (cannot-be-written-as-abundant-sum abnd-nums limit)
  (define abnd-sum-vec (make-vector (+ limit 1) #t))
  (for* ([i abnd-nums]  
         [j abnd-nums] ; Can be optimized by starting from i.
         #:when (<= (+ i j) limit))
    (vector-set! abnd-sum-vec (+ i j) #f)
    )
  
  (for/sum ([i (in-range (+ limit 1))]
            #:when (vector-ref abnd-sum-vec i))
    i
    )
  )

(define abundant-nums-vec (abundant-nums 12 28123))
(cannot-be-written-as-abundant-sum abundant-nums-vec 28123)