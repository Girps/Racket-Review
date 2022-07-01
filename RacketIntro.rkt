
#lang racket
(require slideshow) ;; another way to import a library

; Function concanates two string with '-' character
(define ( hypenConcat x y)
  (string-append x "-" y)
  )


;; snowman function returns a snowman image
(define (snowman x)
  (vc-append (circle (* x 1)) (circle (* x 2)) (circle (* x 3)))
  )

(define c (circle 10))

(define r (rectangle 10 20))




;; Function four takes in 1 argument a circle 
(define (four p)
  (define two-p(hc-append p p)) ;;local bind to two horizontal circles 
  (vc-append two-p two-p)
  )

(define (sqaureFunc n)
  (filled-rectangle n n)
  )

;; Function checker

(define (checker p1 p2)
  (let ((p12 (hc-append p1 p2))
    (p21 (hc-append p2 p1)))
    (vc-append p12 p21))
  )

;; function checkerboard using let* allows mulitple bindings to refer to prior bindings
(define (checkerboard p)
  (let* ([rp (colorize p "red")]
    [bp( colorize p "black")]
    [c (checker rp bp)]
    [c4 (four c)])
    (four c4)))



(define (square n)
  (filled-rectangle n n )
  )

;; bind series with a function arguement or lambda
(define series
  (lambda (mk)
    (hc-append 4 (mk 5) (mk 10) (mk 20))
    )
  )


(define (rgb-series mk)
  (vc-append
   (series (lambda(sz) (colorize (mk sz) "red")))
   (series (lambda(sz) (colorize (mk sz) "green")))
   (series (lambda(sz) (colorize (mk sz) "blue")))
   )
  )

;; Function called f takes in an input of x
(define (f x)
  ( + 2 x)
  )

;; lambda function called add binds to lambda that takes in x and y arguements 
(define add (lambda (x y) (+ x y)))

;; Function called op acceptes: x y z(z is a an anon function)
(define (op x y z)
  (z x y)
  )

(op 1 2 add)


(define (fact n)
  ;; check if initial case is 0
  (if (>= n 0)
  ;; recursive call until we reac 0
  ( if (<= n 0)
       1;; base case return 1
       (* n (fact (- n 1)) );; recrusive case
       )
  ;; else return error
  "N not set of natural numbers "
  )
  )

;; Exponent recrusive funciton works with set of all integers
(define (pow base exp)
  (if (>= exp 0) ;check if input is postive
   (if (= exp 0)
       1; base case return 1
       (* base (pow base (- exp 1))); recursive case
       )
   ; divide
   (if (= exp 0)
       1; return 1 if exp == 0
       (* ( / 1 base) (pow base (+ exp 1))); recursive case
       )
   )
  )

;; Fucntion returns number of 3 in a integer
;; Takes natural numbers as input
(define (count3 int)
      (if (= int 0)
          0 ; base case return 0
          (if (= (abs (remainder  int 10)) 3) ;recursive cases
              (+ 1 (count3 (quotient int 10)));recursvive case add 1 
              (count3 (quotient int 10)) ; recursive case dont add 1
              )
          ))

;; Fucntion returns bool value if number is prime
(define (isPrime n count)
  (if ( <= n count)
      #true
      (if ( = (remainder n count) 0 )
          #false
          (isPrime n (+ 1 count)); recursive case
          )
      )
  )

(define (dupVowel str)
  (if (= 0 (string-length str))
      "";; base case return empty string
      ( if (or (char-ci=? #\A (string-ref str 0) )
          (char-ci=? #\E (string-ref str 0) )
          (char-ci=? #\I (string-ref str 0) )
          (char-ci=? #\Y (string-ref str 0) )
          (char-ci=? #\O (string-ref str 0) )
          (char-ci=? #\U (string-ref str 0) ))
           (string-append (string (string-ref str 0)) ;; recruivse case extra vowel
                          (string (string-ref str 0))
                          (dupVowel (substring str 1)))
           (string-append (string (string-ref str 0)) ;; recursive case no extra vowel 
            (dupVowel (substring str 1)))
           )
  ))