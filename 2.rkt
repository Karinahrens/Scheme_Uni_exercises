; Replacement of an old element of the list for a new one. (Hint: Replacing anything in the empty list yields empty).

(define (replace lst old new)
  (cond
    [(empty? lst) empty ]
    [(equal? (first lst) old) (cons new (replace (rest lst) old new ))]
    [else (cons (first lst) (replace (rest lst) old new))]))


; n-th element (Hint. do recursion on the number, remember sliding lists. Contract: 0 <= n <len(lst) , at least must have one element...)

(define (my-list-ref lst n)
  (cond
    [(= n 0) (first lst)]
    [else (my-list-ref (rest lst) (- n 1))]))


; getFirst n (Hint: do recursion on numbers, remember sliding lists. Contract: 0 <= n <= len(lst). Getting 0 elements returns empty list)

(define (getFirst lst n)
  (cond
    [(= n 0) empty]
    [else (cons (first lst) (getFirst (rest lst) (- n 1 )))]))


; discardFirst n (Hint: do recursion on numbers, remember sliding lists. Contract: 0 <= n <= len(lst). Discarding 0 elements returns whole list)

(define (discardFirst lst n)
  (cond
    [(= n 0) lst]
    [else (discardFirst (rest lst) (- n 1))]))

;(Hard)Number of peaks. Given a list of integers, the number of peaks are those integers whose predecessor and successor in the list are strictly minor. (Hint: You should have at least three elements to compare...
;Otherwise, result is 0)
(define (numOfPeaks lst)
  (cond
    [(<= (length lst) 2) 0]
    [else
     (if (and
          (< (first lst) (second lst))
          (< (third lst) (second lst)))
         (+ 1 (numOfPeaks (rest lst)))
         (numOfPeaks (rest lst)))]))
