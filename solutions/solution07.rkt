#lang racket

(define (is-prime n)
  (cond
    [(= n 1) #f]
    [(< n 4) #t]
    [(= 0 (modulo n 2)) #f]
    [(= 0 (modulo n 3)) #f]
    [else 
     (empty?
      (for*/list ([a (in-range 4 (+ 1 (integer-sqrt n)) 1)]
                  [b (list n)]
                  #:when (= 0 (modulo b a)))
        (* b a))
      )
     ]
    )
  )

#|i must be an odd number|#
(define (nth-prime-from-i n i)
  (cond
    [(<= i 2) (nth-prime-from-i (- n 1) 3)]
    [(and (= n 1) (is-prime i)) i]
    [(is-prime i) (nth-prime-from-i (- n 1) (+ i 2))]
    [else (nth-prime-from-i n (+ i 2))]
    )
  )

(nth-prime-from-i 10000 3)
