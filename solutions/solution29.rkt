#lang racket

(define (distinct-seq-len)
  (length
   (remove-duplicates
    (for*/list ([a (in-range 2 101)]
                [b (in-range 2 101)])
      (expt a b)
      )
    )
   )
  )

(distinct-seq-len)