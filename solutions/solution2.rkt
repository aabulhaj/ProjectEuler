#lang racket
(define (fibonacci max) 
  (define (fibo-mem n1 n2)
    (cond
      [(= n2 1) (append '(1 2) (fibo-mem 1 2))]
      [(> (+ n1 n2) max) '()]
      [else (cons (+ n1 n2) (fibo-mem n2 (+ n1 n2)))]
      )
    )
  (fibo-mem 1 1)
  )

(define (even_fibonacci_sum max)
  (apply + (filter even? (fibonacci max)))
  )

(even_fibonacci_sum 4000000)