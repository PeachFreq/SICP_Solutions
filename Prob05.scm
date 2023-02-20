(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

;; The question is if we call the test procedure with 0 as the first argument and (p) as the second argument, will the interpreter return 0 or will it hang in an infinite loop? It turns out that we observe the latter, which tells us that our interpreter is using applicative order and was therefore trying to fully evaluate the arguments before applying the binary conditional, which it was unable to do.
