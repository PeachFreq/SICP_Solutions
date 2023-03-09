;; Design a cube-root procedure analogous to the square-root procedure that we've been looking at.
;; See page 33 for the mathematical formula that gives one an improved guess.

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.0001))

(define (cbrt x)
  (cbrt-iter 1.0 x))
