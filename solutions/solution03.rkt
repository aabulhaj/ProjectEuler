#lang racket
(define (largest_prime_fact n)
  (define (lpf div)
    (cond
      [(= n div) n]
      [(= (modulo n div) 0) (largest_prime_fact (/ n div))]
      [else (lpf (+ div 1))]
      )
    )
  (lpf 2)
  )

(largest_prime_fact 600851475143)