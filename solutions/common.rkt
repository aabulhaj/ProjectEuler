#lang racket

(define (is-prime n)
  (cond
    [(= n 1) #f]
    [(< n 4) #t]
    [(= 0 (modulo n 2)) #f]
    [(= 0 (modulo n 3)) #f]
    [else 
     (empty?
      (for*/list ([a (in-range 4 (+ 1 (integer-sqrt n)) 1)]
                  [b (list n)]
                  #:when (= 0 (modulo b a)))
        (* b a))
      )
     ]
    )
  )
(provide is-prime)


(define (sieve-primes n)
  (define primes (make-vector (+ n 1) #t))
  (for* ([i (in-range 3 (+ n 1) 2)] ; Run sieve on odd numbers.
         #:when (vector-ref primes i)
         [j (in-range (expt i 2) (+ n 1) i)])
    (vector-set! primes j #f))
  (cons 2 (for/list ([n (in-range 3 (+ n 1) 2)] ; Create a list of all prime nums.
                     #:when (vector-ref primes n))
            n))
  )
(provide sieve-primes)


; Number of prime factors for a given n.
(define (factors-count n (x 2) (count 0))
  (cond
    [(and (= n 1) (= count 0)) 1]
    [(and (> x (add1 (integer-sqrt n))) (= count 0)) 2]
    [(= (modulo n x) 0) (factors-count (/ n x) x (add1 count))]
    [else (if (> count 0) (* (add1 count) (factors-count n (add1 x) 0)) (factors-count n (add1 x) 0))]
    )
  )
(provide factors-count)


(define (num-to-digits x)
  (map string->number
       (drop-right
        (cdr (string-split (number->string x) ""))
        1))
  )
(provide num-to-digits)


(define (divisible? n x)
  (zero? (remainder n x))
  )
(provide divisible?)


(define (divisors-sum n)
  (+ 1
     (for/sum ([i (in-range 2 (add1 (integer-sqrt n)))]
               #:when (divisible? n i))
       (+ i
          (if (>= i (/ n i)) 0 (/ n i))
          )
       )
     )
  )
(provide divisors-sum)