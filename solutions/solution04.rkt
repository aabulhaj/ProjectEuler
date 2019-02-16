#lang racket

(require srfi/13)

(define (is-palindrome n)
  (let* ([x (number->string n)]
         [y (string-reverse x)])
    (string=? x y)
    )
  )

(define (largest-pal)
  (apply max
         (for*/list ([a (in-range 999 100 -1)]
                     [b (in-range a 100 -1)]
                     #:when (is-palindrome (* a b)))
           (* a b))
         )
  )

(largest-pal)
