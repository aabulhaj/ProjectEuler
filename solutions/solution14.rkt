#lang racket
(require racket/dict)

(define collatz-dict (make-hash))
(define (collatz-seq-len n)
  (cond
    [(dict-has-key? collatz-dict n) (dict-ref collatz-dict n)]
    [(= n 1) 1]
    [(even? n) (add1 (collatz-seq-len (/ n 2)))]
    [else (add1 (collatz-seq-len (add1 (* 3 n))))]
    )
  )

; Takes a few seconds to finish running (prefer using a
; vector over a dict. Used dictionary here to learn the API).
(define longest-num-seq 1)
(define (longest-collatz (n 1) (upper 1000000))
  (define seq-len (collatz-seq-len n))
  (dict-set! collatz-dict n seq-len)
  (cond
    [(= n upper) 0]
    [(> seq-len (dict-ref collatz-dict longest-num-seq)) (set! longest-num-seq n) (longest-collatz (add1 n))]
    [else (longest-collatz (add1 n))]
    )
  )

(longest-collatz)
(print longest-num-seq)