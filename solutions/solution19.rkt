#lang racket
(require "common.rkt")

(define month-day-lst '(31 -1 31 30 31 30 31 31 30 31 30 31))

(define (is-leap x)
  (or
   (and (divisible? x 100) (divisible? x 400))
   (and (not (divisible? x 100)) (divisible? x 4))
   )
  )

(define (month-days month year)
  (cond
    [(= month 1) (if (is-leap year) 29 28)]
    [else (list-ref month-day-lst month)]
    )
  )

(define accum 2) ; We start on a Tuesday.
(define sundays 0)
(define (sundays-in-year year)
  (for ([month (in-range 12)])
    (define days (month-days month year))
    (set! accum (+ accum (modulo days 7)))
    (if (divisible? accum 7)
        (set! sundays (add1 sundays))
        null)
    )
  )

(define (sol curr-year max-year)
  (cond
    [(<= curr-year max-year)
     (sundays-in-year curr-year)
     (sol (add1 curr-year) max-year)]
    )
  )

(sol 1901 2000)
(print sundays)