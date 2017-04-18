#lang racket
(require picturing-programs)
(define white-key (rectangle 80 300 "outline" "black"))
(define black-key (rectangle 50 200 "solid" "black"))
(define white-key-pressed (square 50 "solid" "black"))
(define black-key-pressed (rectangle 50 200 "solid" "white"))
(define PIANO
  (overlay/align/offset "left" "top" (overlay/xy  black-key 100 0 (overlay/xy black-key 140 0 (overlay/xy black-key 80 0
     (overlay/xy black-key 80 0 black-key)))) -50 0 (beside white-key white-key white-key white-key white-key white-key white-key white-key)))

(define background
  (overlay PIANO
          (rectangle 900 500 "solid" "gray")))

  
(define (white-pressed t)
  (place-image/align white-key-pressed
                     t 330
                     "left" "top"
                     background))

(define (black-pressed t)
  (place-image/align black-key-pressed
                     t 100
                     "left" "top"
                     background))

(define (nothing-pressed t)
  (place-image background
               t 0
               (rectangle 900 500 "solid" "gray")))


(define (key-press im k)
   (cond [(equal? k "a") (white-pressed 150)]
         [(equal? k "s") (white-pressed 230)]
         [(equal? k "d") (white-pressed 310)]
         [(equal? k "f") (white-pressed 390)]
         [(equal? k "g") (white-pressed 470)]
         [(equal? k "h") (white-pressed 550)]
         [(equal? k "j") (white-pressed 630)]
         [(equal? k "k") (white-pressed 710)]
         [(equal? k "w") (black-pressed 180)]
         [(equal? k "e") (black-pressed 280)]
         [(equal? k "t") (black-pressed 420)]
         [(equal? k "y") (black-pressed 500)]
         [(equal? k "u") (black-pressed 580)]
        [else im]))


(big-bang background
          (to-draw show-it)
          (on-key key-press)))