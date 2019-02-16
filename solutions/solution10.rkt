#lang racket

(require "common.rkt")

(apply + (sieve_primes 2000000))
