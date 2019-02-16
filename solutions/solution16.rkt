#lang racket
(define num-str (number->string (expt 2 1000)))
(define digits-str-list (drop-right (cdr (string-split num-str "")) 1)) ; First and last element after splitting the string are empty strings.
(apply + (map string->number digits-str-list))