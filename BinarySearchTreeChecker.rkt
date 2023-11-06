#lang Scheme
#| bst? function with list as parameter|#
(define(bst? ls)
#|bst-help function with list as parameter, minimum and maximum value assumed|#
  (bst-help ls -1000000000 1000000000))

(define (bst-help ls minVal maxVal)
  (cond
    #|if list is null return true|#
    ((null? ls) #t)
    #|if first element is less than minVal return false|#
    ((< (car ls) minVal) #f)
    #|if first element is greater than maxVal return false|#
    ((> (car ls) maxVal) #f)
    #|else return bst-help for left child and bst-help for right child|#
    (else
     (and
      (bst-help (cadr ls) minVal (- (car ls) 1))
      (bst-help (caddr ls) (+ (car ls) 1) maxVal)
      )
     )
    )
  )

(bst? '(4 (2 (1 () ()) (3 () ())) (6 (5 () ()) ()))) ; #t
(bst? '(4 (2 (1 () ()) (3 () ())) (6 (9 () ()) ()))) ; #f
(bst? '(4 (2 (1 () ()) (3 () ())) (1 (5 () ()) ()))) ; #f
(bst? '(4 (7 (1 () ()) (3 () ())) (6 (5 () ()) ()))) ; #f
(bst? '(4 (2 (1 () ()) (1 () ())) (6 (5 () ()) ()))) ; #f
(bst? '(4 (2 (4 () ()) (3 () ())) (6 (5 () ()) ()))) ; #f
(bst? '(4 (2 (1 () ()) (3 () ())) (6 () (9 () ())))) ; #t
           
       
