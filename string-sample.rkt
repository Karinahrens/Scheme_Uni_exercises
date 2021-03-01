;; Don't worry to understand this code.
;; You will understand later.
;; Keep calm.
(define (string-indexOfN chr str n)
  (cond
    [(= (string-length str) n) n]
    [ else 
      (if (equal? (string-ref str n) chr) n
          (string-indexOfN chr str (+ n 1))
          )   ]
    )
  )
;; this function computes find() string method in Python
;; i.e. 'Rafael'.find('a') would return 1
;; 
;; Returns length of string if not present.
;; invoke as in
;; (string-indexOf "\space" "Andrew Wicks")
(define (string-indexOf chr str)
  (string-indexOfN chr str 0 )
  )

;; Start here to play with
;; string-ref, string-downcase,
;; string-append, substring, string-indexOf...
(string-downcase "Andrew Wicks")
(string-ref "Andrew Wicks" 0)
(string-indexOf '\space' "Andrew Wicks")
(substring "Andrew Wicks" 7)
(string-indexOf '0' "Wicks")
(string-length "Wicks")
(string-append "awicks" '"@gre.ac.uk")
;; When done, invoke your just defined symbol email
;; on any formatted string "FirstName LastName"
(define (email name )
  [cond
  [string-downcase name
   [string-append 
    [substring name 0 1]
    [substring
     name
     [+ (string-indexOf #\space name) 1]
     [string-length name]
     ]
    "@gre.ac.uk"]]])

;(email "Rafael Martinez")
(email  "Rafael Martinez")

;(email "Andrew Wicks")
(email "Andrew Wicks")
;;(email "Ralph Barthel")
(email "Ralph Barthel")
