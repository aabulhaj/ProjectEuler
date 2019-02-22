#lang racket
(require memo)

(define triangle
  (map (lambda (x)
	 (map string->number (string-split x))) (file->lines "problems_files/solution67-triangle.txt"))
  )

(define/memoize (max-path-sum lst i)
  (cond
    [(empty? lst) 0]
    [else
     (define curr-lst (car lst))
     (max
      (+ (list-ref curr-lst i) (max-path-sum (cdr lst) i))
      (+ (list-ref curr-lst i) (max-path-sum (cdr lst) (add1 i)))
      )]
    )
  )

(max-path-sum triangle 0)