;; list-expressions
(list 1 2 (list "wine" "bear"))

;; We define a new symbol to avoid typing
(define my-list (list 1 2 (list "wine" "bear")))

;; length of outer list
(length my-list)

;; length of inner list
(length (list-ref my-list 2))

;; length of first string in the inner list
(let
    ([nested-list (list-ref my-list 2)])
    (string-length (list-ref nested-list 0)))

;; Access to second element
(first (rest my-list))

;; Access to inner list
(rest (rest my-list))

;• check if it is a list:
; The first element of the outer list. (false)
(list? (car my-list))

; The third element of the inner list (true)
(list? (cddr (cdr my-list)))

; The first element of the innerlist (false, it is an string)
(let([nested-list (list-ref my-list 2)])  
  (list? (list-ref nested-list 0)))

;• get access to the second element of the outer list (2)
;o Using exclusively first, rest.
(first (rest my-list))

;o Using exclusively car, cdr.
(car (cdr my-list))

;• get access to the inner list ((“wine”,”beer”))
;o Using exclusively first, rest.
(rest (rest my-list))

;o Using exclusively car, cdr.
(cddr my-list)




