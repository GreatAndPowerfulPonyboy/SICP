(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
       (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))
(sqrt 9)
(sqrt 16)

(sqrt 25)

(sqrt 81)

(sqrt 144)

(sqrt 225)

(define (square x) (* x x))

(square 5)

(define (cube-root-improve guess x)
  (/ 
    (+
      (/ x (square guess))
      (+ guess guess))
    3))
(define (cube-good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))
(define (cube x) (* x x x))
(cube 3)
(define (cube-root-iter guess x)
  (if (cube-good-enough? guess x)
    guess
    (cube-root-iter (cube-root-improve guess x) x)))
(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27)

(cube-root 64)


