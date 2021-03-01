;; This is what we call Immersive Function.
;; You will learn later.
(define (primeG n N)
  (cond
    [(= n N) #t]
    [(= (modulo N n) 0) #f]
    [else (primeG (+ n 1) N)]
    )
  )

(define (prime n)
  (primeG 2 n)
  )

; 15 % 3
(modulo 15 3)
;(7 + 2 ) // 4
(quotient (+ 7 2) 4)
; (15 % 3 ) == 0 Check if 3 is divisor of 15.
(= (modulo 15 3) 0)



;; Translate these two functions into Scheme.
;; Then call it as in
(prime 5)
(prime 11)