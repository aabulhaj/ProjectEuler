#lang racket
(require "common.rkt")

(define (consec-primes a b)
  (let loop ([n 0])
    (if (is-prime (+ (* n n) (* a n) b))
        (loop (add1 n))
        n
        )
    )
  )

(define (quadratic-primes)
  (for*/fold ([max-consec-primes 0]
              [mult 0]
              #:result mult)
             ([a (in-range -1000 1001 1)]
              [b (in-range -1000 1001 1)])
    (define consec-primes-count (consec-primes a b))
    (cond
      [(> consec-primes-count max-consec-primes)
       (values consec-primes-count (* a b))]
      [else  (values max-consec-primes mult)]
      )
    )
  )

(quadratic-primes)