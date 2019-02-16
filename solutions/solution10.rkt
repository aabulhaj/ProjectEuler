#lang racket

(require "common.rkt")

(apply + (sieve-primes 2000000))
