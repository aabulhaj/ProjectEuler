#lang racket
(define (largest-prime-fact n)
  (define (lpf div)
    (cond
      [(= n div) n]
      [(= (modulo n div) 0) (largest-prime-fact (/ n div))]
      [else (lpf (+ div 1))]
      )
    )
  (lpf 2)
  )

(largest-prime-fact 600851475143)
