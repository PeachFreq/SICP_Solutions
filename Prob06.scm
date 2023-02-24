;; Alyssa takes Eva's advice and tries to implement a modified version of if using cond.
;; As a note, I think this should work fine. If is just a special case of cond where there are two conditions.

;; Here is Eva's recommended version...
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;; Alyssa uses this procedure to rewrite her square root procedure as follows...
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

;; Unfortunately this will not work. She will find that the interpreter gets stuck in a loop and soon maximum recursion depth is reached.
;; This is because the interpreter works in applicative order and the alternative cannot ever be fully evaluated. If is a special form in that it effectively bypasseses the argument that it does not need to evaluate.
