#lang racket
(require "common.rkt")

(define primes (sieve-primes 1000))

(define (cycle-length n)
  (if (or (= n 5) (= n 2)) 0 ; Only check primes with rec tail.
      (let loop ([p 1])
        (if (not (=
                  (modulo (expt 10 p) n) ; (10 ** p) % n != 1 -> p++
                  1))
            (loop (add1 p))
            p
            )
        )
      )
  )


(define (reciprocal-cycles)
  (let loop ([max-len 0] [max-idx 0] [d-idx 0])
    (define curr-len (cycle-length (list-ref primes d-idx)))
    (cond
      [(= (add1 d-idx) (length primes)) (list-ref primes max-idx)]
      [(> curr-len max-len) (loop curr-len d-idx (add1 d-idx))]
      [else (loop max-len max-idx (add1 d-idx))]
      )
    )
  )

(reciprocal-cycles)