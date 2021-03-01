;; Define my dictionary.
(define my-dict (list (cons 'andrew 2) ( cons 'ralph 5) (cons 'yassmine 3)))
;; is-dictionary?
;; P : a Given lst
(define (is-dictionary? lst)
  (cond
    [(empty? lst) #t]
    [else (let
              ([a (first lst)])
            (and (pair? a)
                 (symbol? (car a))
                 (is-dictionary? (rest lst))))]))

;; Uncomment
;;(is-dictionary? (list (cons 'car 2) ( cons 4 5)))
;;(is-dictionary? (list (cons 'car 2) ( cons 'r 5)))


;; keys
;; P : A given dictionary
(define (keys-dict dict)
  ;;
  (cond
    [(empty? dict) empty]
    [else
     (cons (car (first dict)) (keys-dict (rest dict)))
     ]
    ))

;; keys
;; P : A given dictionary
(define (values-dict dict)
  ;;
  (cond
    [(empty? dict) empty]
    [else
     (cons (cdr (first dict)) (values-dict (rest dict)))
     ]
    ))

;; dictionary
;; P : length dictionary
(define (length-dict dict)
  ;;
  (cond
    [(empty? dict) 0]
    [else
     (+ 1 (length-dict (rest dict)))]))

;; P : Should be not empty!
;; Must contain the key
(define (value dict key)
  (cond
    [(empty? dict) (first dict)] ;; This is failure
    ;;  [ (= 1 (length-dict dict)) (cdr (first lst))] ;; Shoud be the vlaue   
    [else
     (if (equal? (car (first dict)) key)
         (cdr (first dict))
         (value (rest dict) key))]))

;; P : Must be passed a dictionary
(define (contains-key? dict key)
  (cond
    [(empty? dict) #f]
    [else
     (or
      (equal? (car (first dict)) key)
      (contains-key? (rest dict) key))]))


;; P : A dictionary possible empty.
(define (set-value dict key value)
  (cond
    ;; Base
    [(empty? dict) (list (cons key value))]
    ;; Base  ; we found the key.
    [(equal? (car (first dict)) key)
     (cons
      ;; changing actual value for the new
      ;; the rest of dictionary keeps the same
      (cons (car (first dict)) value)  (rest dict))]
    ;; General. first pair is kept. try to apply on second...
    [else ( cons (first dict) (set-value (rest dict) key value))]))