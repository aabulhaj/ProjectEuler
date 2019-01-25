#lang racket

(require srfi/13)

(define (is_palindrome n)
  (let* ([x (number->string n)]
         [y (string-reverse x)])
    (string=? x y)
    )
  )

(define (largest_pal)
  (apply max
         (for*/list ([a (in-range 999 100 -1)]
                     [b (in-range a 100 -1)]
                     #:when (is_palindrome (* a b)))
           (* a b))
         )
  )

(largest_pal)