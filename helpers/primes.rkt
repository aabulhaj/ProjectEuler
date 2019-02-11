#lang racket

(define (is_prime n)
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
(provide is_prime)


(define (sieve_primes n)
  (define primes (make-vector (+ n 1) #t))
  (for* ([i (in-range 3 (+ n 1) 2)] ; Run sieve on odd numbers.
         #:when (vector-ref primes i)
         [j (in-range (expt i 2) (+ n 1) i)])
    (vector-set! primes j #f))
  (cons 2 (for/list ([n (in-range 3 (+ n 1) 2)] ; Create a list of all prime nums.
                     #:when (vector-ref primes n))
            n))
  )
(provide sieve_primes)