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


(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


(A 1 10)

(A 2 4)

(define (fibonacci n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

(fibonacci 0)

; Exercise 1.11
(define (fn n)
  (cond ((< n 3) n)
        (else (+  (fn (- n 1)) 
                  (* 2 (fn (- n 2))) 
                  (* 3 (fn (- n 3)))))))
(fn 5)

(define (fn n)
  (define (fn-iter a b c count)
    (cond ((= n 0) c)
          ((= n 1) b)
          ((= n 2) a)
    (else (if (> count (- n 3))
            a
           (fn-iter (+ a (* 2 b) (* 3 c) )
                    a b (+ count 1))))))
  (fn-iter 2 1 0 0))
(fn 5)

;Better way of doing this
;We keep track of our last n computations and the
;Current step number. When we've hit the step number
;we return the last computation (n - 1)
(define (fn2 n)
  (define (f-iter n-1 n-2 n-3 nth)  
   (if (= n nth) 
    n-1
   (f-iter (+ n-1 (* 2 n-2) (* 3 n-3) )
           n-1
           n-2
           (+ 1 nth))))
  (if (< n 3)
    n
   (f-iter 2 1 0 2)))

(fn2 5)


