#lang racket

(require "../helpers/primes.rkt")

(apply + (sieve_primes 2000000))