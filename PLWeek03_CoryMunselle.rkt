#lang racket
(define (leibniz num)
  ; Function leibniz start
  (define (findSign i)
    ; Function findSign start
    (if (= (modulo i 2) 0) 
        1 ; True
        -1)) ; False
    ; Function findSign end
  (if (> num 0)
      ; Translation: {leibniz(num-1) + [+-1 / (num*2 +1)]} Note: +- is determined by findSign
      (+ (* (findSign num) (/ 1 (+ 1 (* 2 num)))) (leibniz (- num 1)) ) ; True
      (- 1 num)))
  ; Function leibniz end
(exact->inexact (leibniz 100))

(define (leibnizLambda num)
  ; Function leibnizLambda start
  (if (> num 0)
      ; Translation: same as above but findSign is replaced with a lambda function that calculates inline
      (+ (* ((lambda (i) (if (= (modulo i 2) 0) 1 -1)) num) (/ 1 (+ 1 (* 2 num)))) (leibnizLambda (- num 1))) ; True
      (- 1 num))) ; False
  ; Function leibnizLambda end
(exact->inexact (leibnizLambda 100))