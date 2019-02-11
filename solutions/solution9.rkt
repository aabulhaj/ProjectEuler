#lang racket
(define (special_py_triplet)
  (first (for*/list ([a (in-range 1 1000)]
                     [b (in-range (+ a 1) 1000)]
                     #:when (let ([c (- 1000 a b)])
                              (and (< b c) (= (+ (expt a 2) (expt b 2)) (expt c 2)))))
           (* a b (- 1000 a b))))
  )

(special_py_triplet)

