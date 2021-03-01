;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;a Given a number, its absolute value (Hint: use conditional)
((lambda (n) (if (> n 0) n (- n)))-4)

;b Given two numbers, return if second divides first (Hint: use modulo)

(lambda (m n)(= (modulo m n) 0))
;c Given a predicate and a list, if any member of the given list fits that predicate (Hint: use ormap)
(lambda (pred? lst) (ormap pred? lst))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Implement a function that, given a number > 1, return if it is a prime. Hints:
;a Import racket library, then you have symbol range. Given a number, formulate the list between 2 and the number (not included). Check if any (ormap) of these numbers divide the number.
; Alternative: filter the divisors for that number. Check if its empty
(require racket)
(define (prime? n)
  (empty?
   (filter
    (lambda (v) (= (modulo n v) 0))
    (range 2 n))))
;b Function given a list of numbers, all of them > 1, yields only prime numbers.
(define (filterPrimes lst)
  (filter
   (lambda (u) (prime? u)) 
   lst))
;c Expression to compute all primes before 10000.
(filterPrimes (range 2 100))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; a  Rename the andmap as a symbol forall. (define forall andmap)
(define forall? andmap)
;b Write a functional exists, such that given a list yields if there is an element fitting the predicate. Use it in terms of forall (Hint: exists an element such that p <-> not for all elements it happens not p)
(define (exists?  pred? lst)
  (not (forall?
        (lambda (u) (not (pred? u)))
        lst)))
;c Write a functional, selectiveSum, that given a list of numbers and a predicate, compute the sum only of the numbers fitting that predicate. Hints:filter every number fitting that predicate, then sum all those numbers (apply)
(define (selectiveSum pred? lst)
  (apply
   +
   (filter pred? lst)))
;d Write a functional my-partition, such that given a boolean predicate and a list, returns a pair of lists, first hosting those fitting the property, and second host those not fitting it.
(define (selectiveSum2 pred? lst)
  (foldl
   (lambda (u n) (if (pred? u) (+ u n) n))
   0
   lst))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exercise 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Inventory. An inventory can be emulated with a list of triples, each triple being a list of three elements: the first being a symbol for the product, and the second and third the number the number of items
 ;and price, respectively.
;a Check is a given value is a valid inventory
(define inventory '( (prod1 1 15) (prod2 2 1) (prod3 10 5)))

(define (inventory? inv)
  (and
   (list? inv)  ;; it is a list
   (andmap      ;; for all members...
    (lambda (u) (and
                 (list? u)
                 (= (length u)3)   ;; has length 3
                 (symbol? (first u))  ;; first symbol
                 (integer? (second u))  ;; second integer
                 (integer? (third u))))
    inv )))

;b Total of items at inventory
(define (total-items inv)
  (apply
   +
   ;; Think two stages
   (map
    (lambda (u) (second u))
    inv)))


;c Compute the total value of the inventory.
(define (total-value inv)
  (apply
   + ;;
   (map
    (lambda (u) (* (second u) (third u))) ;; makes product
    inv)))
;d Compute the average of any item in the inventory.
(define (average-value inv)
  (let
      ([ my-total (total-items inv)]
       [ my-value (total-value inv)])
    (/ my-value my-total)))
;e For each product, compute the vat (0.14 * store price).
;; list->list
;; compute vat for each product
(define (vat inv)
  (map
   (lambda (u) (list (first u)(* (third u) 0.14)))
   inv))


(define (final-price inv)
  (map
   (lambda (u) (list (first u)(* (third u) 1.14)))
   inv))

;; filter those items under stock 20
;; we just want the item
;; P ; inventort
(define (low-stock inv quantity)
  (map
   (lambda (u) (first u)) ;; extract only the symbol
   
   (filter
    (lambda (u) (< (third u) quantity))
    inv)))
;; another watm floating complex expressions
;; filter those items under stock 20
;; we just want the item
(define (low-stock2 inv quantity)
  (let
      (
       [my-filter  (filter
                    (lambda (u) (< (third u) quantity))
                    inv)]
       )
    (map
     (lambda (u) (first u)) ;; extract only the symbol
     my-filter)))
;; P non-empty inv
(define (cheapest-item2 inv)
  (first ;; we just want the symbol
   
   (foldl
    (lambda (u acum) (if (< (third u) (third acum))
                         u
                         acum))  ;; this a modified version of max.
    (first inv)
    (rest inv) ;; the rest
    )))