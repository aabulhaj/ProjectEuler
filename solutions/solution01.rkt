#lang racket 
(define sum
  (lambda (x limit)
    (cond
      [(>= x limit) 0]
      [(or (= (modulo x 3) 0) (= (modulo x 5) 0))
       (+ x (sum (+ x 1) limit))]
      [else (sum (+ x 1) limit)])))

(sum 1 1000)
