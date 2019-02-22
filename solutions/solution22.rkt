#lang racket
(define names
  (sort
   (map (lambda (x) (string-trim x "\""))
        (string-split (file->string "problems_files/problem22-names.txt") ","))
   string<?)
  )

(define (name-score name)
  (apply +
         (map (lambda (x) (- (char->integer x) 64)) (string->list name))
         )
  )

(define (names-scores)
  (for/sum ([i (in-range (length names))])
    (* (add1 i) (name-score (list-ref names i)))
    )
  )

(names-scores)