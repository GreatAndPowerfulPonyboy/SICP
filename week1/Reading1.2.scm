(define (square x) (* x x))
(square 8)

(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))
(factorial 8)

(= (factorial 8) (* 8 (factorial 7)))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
    product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))
(define (factorial n) 
      (fact-iter 1 1 n))

(factorial 6)

; Exercise 1.9
; Mainly just noting for myself that the first definition 
; calls inc on +, while the second operation calls + on dec and inc
;
