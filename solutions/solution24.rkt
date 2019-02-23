#lang racket
(require "common.rkt")

; Not sure how I can return the maximal pair,
; thus the code duplication.
(define (nearest-factorial-mult n k nums)
  (define suffix (factorial k))
  (max-list
   (for/list ([i (in-range (length nums))]
              #:when (< (* i suffix) n))
     (list-ref nums i))
   )
  )

(define (nearest-factorial-mult-idx n k nums)
  (define suffix (factorial k))
  (max-list
   (for/list ([i (in-range (length nums))]
              #:when (< (* i suffix) n))
     i)
   )
  )

(define (lex n letters-left nums)
  (cond
    [(= letters-left 1) nums]
    [else
     (define num (nearest-factorial-mult n (sub1 letters-left) nums))
     (define idx (nearest-factorial-mult-idx n (sub1 letters-left) nums))
     (cons num
           (lex
            (- n (* idx (factorial (sub1 letters-left))))
            (sub1 letters-left)
            (remove num nums))
           )]
    )
  )

(lex 1000000 10 '(0 1 2 3 4 5 6 7 8 9))