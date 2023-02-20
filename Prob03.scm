;; Define a procedure that takes three numbers and returns the sum of the squares of the two larger numbers

(define (sos x y)
  (+ (square x) (square y)))

(define (sos-bigs x y z)
  (cond ((and (<= x y) (<= x z)) (sos y z))
	((and (<= y x) (<= y z)) (sos x z))
	((and (<= z x) (<= z y)) (sos x y))))
