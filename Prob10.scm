;; Ackermannn's function

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1) (A x (- y 1))))))

(define (f n) (A 0 n)) ;; The mathematical representation of this function is f=2*n

(define (g n) (A 1 n)) ;; We see that the pattern that gets evolved here is that for
;; every integer multiple of 1 (bad phrasing on my part) that n is above 0, we get one
;; factor of 2. n=1 results in 2. n=2 results in 4. n=3 results in 8. Thus the mathematical
;; representation is g=2^n where n is a nonzero positive integer.

(define (h n) (A 2 n)) ;; This one is a bit more complicated. We see that a tree is emerging
;; in the recursive process that is being evolved by this recursive procedure. x=2 is the
;; starting point, so when none of the 3 conditions are met the result is a call of A on x=1
;; and y= (A 1 (A 2 (dec y))). Eventually the stop condition will be when y=1, at which point
;; A will return 2. So we see that the eventual result is to return a certain number of
;; factors of 2. But how many? Testing out this function we see that h(1)=2, h(2)=4, h(3)=16,
;; h(4)=65536. In other words, n=1 yields 1 factor of 2, n=2 yields 2 factors of 2, n=3
;; yields 4 factors of 2, n=4 yields 16 factors of 2, …. A good way to see what's happening is
;; to be very explicit in the evolution, so le's look at the example of n=4:

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 (expt 2 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 (A 0 (A 0 (expt 2 2))))
(A 1 (A 0 (A 0 4)))
(A 1 (A 0 (* 2 4)))
(A 1 (A 0 8))
(A 1 (* 2 8))
(A 1 16) ;; Using insights learned from g to jump ahead here
(expt 2 16)
65536

;; So we can now see the pattern. n=2 is 2 to the 2 power. n=3 is 2 to
;; the 2 to the 2 power. n=4 is 2 to the 2 to the 2 to the 2 power (four 2's
;; laddering up as exponentials). I'm honestly not sure how to write this in
;; closed mathematical form, but the pattern is clear.
