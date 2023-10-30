#lang Scheme
(define (listPrimesBelow n)
  (define (isPrime i x)
    (cond ((> x (/ i 2)) #t)
          ((= (modulo i x) 0) #f)
          (else (isPrime i (+ x 1)))))
  (define (helper i lst)
    (cond ((< i 2) lst)
          ((isPrime i 2) (helper (- i 1) (cons i lst)))
          (else (helper (- i 1) lst))))
  (reverse (helper (- n 1) '())))

(listPrimesBelow 2)

(listPrimesBelow 11)

(listPrimesBelow 32)