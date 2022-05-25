#lang racket
(define factorial arg
  (if (equal? x 0)
      (* arg (factorial (-x 1)))
      )
  )