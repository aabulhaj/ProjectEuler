#lang racket
(require "common.rkt")

(define (digits-num n)
  (length (num-to-digits n))
  )

(define (fib n)
  (let loop ([prev 0] [curr 1] [idx 1])
    (cond
      [(>= (digits-num curr) n) idx]
      [else (loop curr (+ curr prev) (add1 idx))]
      )
    )
  )

(fib 1000)