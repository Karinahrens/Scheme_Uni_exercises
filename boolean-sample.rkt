;; Propositional logic with Scheme
;; 1.- 
(define p #f)
(define q #t)
;; 2.- 
(not p)
(and p q)
(or p q)
(not (or p q))
(not (and p q))
(and (not p) q)
(not (not p))
;; 3.- 
(define (my-nand p q) (not (and p q)))
(define (my-nor p q) (not (or p q)))
(define (my-xor p q) (or(and(not p) q) (and p (not q)))) 
;; 4 .- 
(my-nand p p)
(my-nor p q)
(my-xor q q)
  