#lang Scheme
(define (bst? tree)
  (let ((value (car tree))
        (left (cadr tree))
        (right (caddr tree)))
    (cond
      ((null? tree) #t) ; and empty tree is a BST
      ((and (null? left) (null? right)) #t) ; a leaf node is a BST
      ((null? left) (and (<= value (car (car right))) (bst? right))) ; only right subtree
      ((null? right) (and (>= value (car (car left))) (bst? left))) ;only left subtree
      (else (and (<= value (car (car right))) (>= value (car (car left)))
                 (bst? left) (bst? right))) ;both subtrees
      )))

(bst? '(4 (2 (1 () ()) (3 () ())) (6 (5 () ()) ()))) ; #t
(bst? '(4 (2 (1 () ()) (3 () ())) (6 (9 () ()) ()))) ; #f
(bst? '(4 (2 (1 () ()) (3 () ())) (1 (5 () ()) ()))) ; #f
(bst? '(4 (7 (1 () ()) (3 () ())) (6 (5 () ()) ()))) ; #f
(bst? '(4 (2 (1 () ()) (1 () ())) (6 (5 () ()) ()))) ; #f
(bst? '(4 (2 (4 () ()) (3 () ())) (6 (5 () ()) ()))) ; #f
(bst? '(4 (2 (1 () ()) (3 () ())) (6 () (9 () ())))) ; #t
           
       