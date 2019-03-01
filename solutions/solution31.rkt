#lang racket

(define (change-counter val coins)
  (cond
    [(= 0 val) 1]
    [(= 0 (length coins)) 0]
    [(<= (car coins) val) ; either use the current coin, or skip it.
     (+
      (change-counter (- val (car coins)) coins)
      (change-counter val (cdr coins))
      )]
    [else (change-counter val (cdr coins))]
    )
  )

(change-counter 200 (list 200 100 50 20 10 5 2 1))


