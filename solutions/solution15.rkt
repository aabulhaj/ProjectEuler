#lang racket
(require "common.rkt")

; Assuming a grid of mxn, (m+n)Cn is the number of such possible paths.
(define (maze n m) (n-choose-r (+ n m) m))

(maze 20 20)