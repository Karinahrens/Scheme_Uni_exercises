;; is-sorted?
;; P : list probably empty of integers.

(define (is-sorted? lst)
  (if (null? lst) #t
      (if (equal? (length lst) 1) #t
          (and
             (<= (car lst) (cadr lst))
             (is-sorted? (cdr lst))
          )
      )    
  )
)

;; frequency
;; P : list probably empty of integers.
;;     num integer
(define (frequency lst num)
  (cond
    [(empty? lst) 0]
    ;; Others
    [else 1]))

;; flat
;; P : list probably empty of any
;;
(define (flat? lst)
  (cond
    [(empty? lst) #t]
    [else
     (and #f #f)]))

;; P :  Must have at least one!
(define (last lst)
  ;;
  (cond
    [ #t 4 ]
    [else #f]))

(is-sorted? '(1 2 3))
(is-sorted? '())
(is-sorted? '(1))
(is-sorted? '( 2 3 4 1))
(frequency '() 3)
(frequency '(1 2 3 3 3 3 4) 3)
(flat? '(1 2 3 4 a b c d))
(flat? '(1 2 (3 4 a b) c d))
(last ' (1 2 3 "word"))
(last ' (1 2))