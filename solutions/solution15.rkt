#lang racket

; Assuming a grid of mxn, (m+n)Cn is the number of such possible paths.
(define (n-choose-r n r)
  (apply *
         (for/list
             ([i  (in-range 1 (add1 r) 1)]) 
           (/ (+ (- n r) i) i)) ; https://en.wikipedia.org/wiki/Binomial_coefficient#Multiplicative_formula
         )
  )

(define (maze n m) (n-choose-r (+ n m) m))

(maze 20 20)