#lang racket


;; Pair functions
(cons 1 2) ;; constructs a pair structure
(car '(x.y)) ;; function pulls first element in the pair
(cdr '(x.y)) ;; function pulls the 2nd element in the pair
(equal? '(x.y) '(y.x)) ;; are they equal
(pair? '(x.y))


;; Pairs
(cons 1 2 )
(cons 1 (cons 4 8))
(car '(4 . 8))
(cdr '(4 . 8))
(car (cdr '(1 . (4 . 8))))


(car (cons 1 2)) ;; using function cons to create a pair
(cdr (cons 1 2)) ;; construct a pair and get second element
(cons 0 (cons 1 2)) ;; create a pair of (0 (1.2))

;; ' token stops racket from evaluating a (...) used for all lists

'(1 2 3 4)
'((i hate) (always (hurt)) the (one you) love)
'(add 3 (mult 4 5))
'(garbage (garbage) out)

(* (+ 1 2 ) 4) ;; an expression to be evaluated
'(* (+ 1 2) 4 ) ;;makes it a symbol

(define (sum1 1st)
  (if (null? 1st)
      0;; then
      (if (number? (first 1st))
          (+ (car 1st) (sum1 (cdr 1st)));; number recursive
          (+ (sum1 (car 1st)) (sum1 (cdr 1st))))
          )
      )

(cons 1 2) ;; creates a pair
(cons 1 '(2)) ;; second arg is a list now single lis t
(cons 3 '4) ;; creates a pair again
 (cons '(1) '(2))

;; list functions
(member 3 '(2 3 7))