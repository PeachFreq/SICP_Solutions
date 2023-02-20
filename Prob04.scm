(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Looking at the conditional in the body of our procedure we see that the conseequent is not a value but is itself an operator, as is the alternative. Thus we can see that to accomplish the goal of adding to a the absolute value of b the two paths are add b if b is a positive number or subtract b if b is a non-positive number.
