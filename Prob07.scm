;; The key to understanding why very small numbers would not work in the Newton's method as we've written it is understanding that the square of a very small number is a very very small number.
;; For instance, let's say we're looking for the square root of 0.001. The original program checks that the guess squared is within 0.001 of the radicand. In this example we will not get convergence to the correct answer, which is 0.0316.
;; In the case of very large numbers, arithmetic operations are typically performed with limited precision, which means that our super-precise requirement for success (wthin 0.001) is not realistic. Just the noise resulting from the arithmetic will likely be many orders of magnitude greater than this required level of precision.
;; So we can say that our program as written is only suitable for a certain range of "well-behaved" numbers.

;; This problem contains a hint that an alternative approach would be to use a test condition that watches how guess changes from one iteration to the next, and to stop when the change is a very small fraction of the guess. To do this we need only modifiy our `good-enough?` predicate, as well as change the second argument that good-enough? is getting fed. It used to be the radicand in the old method. Now it is to be the improved guess. So we make the second argument be what is returned by the improve procedure when called on the previous guess.

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? last-guess improved-guess)
  (< (abs (/ (- improved-guess last-guess) improved-guess)) (/ improved-guess 10000)))

(define (sqrt-alt x)
  (sqrt-iter 1.0 x))

;; Becuase I've implemented the test condition to be relative rather than absolute, this program will work better for very large radicands and very small radicands.
