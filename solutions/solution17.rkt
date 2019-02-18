#lang racket
(define ones (map string-length (list "" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten"
                                      "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen")))

(define tens (map string-length (list "" "" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety")))


(define (num-len n)
  (cond
    [(< n 20) (list-ref ones n)]
    [(< n 100) (let* ([one (modulo n 10)]
                      [ten (floor (/ n 10))])
                 (+ (list-ref ones one) (list-ref tens ten))
                 )]
    [(< n 1000) (let* ([hundred (floor (/ n 100))])
                  (+ (list-ref ones hundred)
                     (num-len (modulo n 100))
                     7 ; Length of "hundred"
                     (if (= 0 (modulo n 100)) 0 3) ; If n%100==0, we don't use and
                     )
                  )]
    [(= n 1000) 11]) ; len of "one thousand" (without space)
  )

(define (num-letter-counts n)
  (apply +
         (for/list
             ([i (in-range 1 (add1 n) 1)])
           (num-len i))
         )
  )

(num-letter-counts 1000)
