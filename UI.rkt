#lang racket
(require picturing-programs)

(define A (rectangle 80 300 "outline" "black"))
(define A1 (rectangle 80 300 "solid" "black"))
(define B (rectangle 80 300 "outline" "black"))
(define C (rectangle 80 300 "outline" "black"))
(define D (rectangle 80 300 "outline" "black"))
(define E (rectangle 80 300 "outline" "black"))
(define F (rectangle 80 300 "outline" "black"))
(define G (rectangle 80 300 "outline" "black"))
(define H (rectangle 80 300 "outline" "black"))
(define I (rectangle 50 200 "solid" "black"))
(define J (rectangle 50 200 "solid" "black"))
(define K (rectangle 50 200 "solid" "black"))
(define L (rectangle 50 200 "solid" "black"))
(define M (rectangle 50 200 "solid" "black"))

(define white-keys
  (beside A B C D E F G H))

(define black-keys
  (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))))

(define PIANO
  (overlay/align/offset "left" "top" black-keys -50 0 white-keys))

(define (key-press im k)
   (cond [(equal? k "a") (set! A A1)]
        [else im]))

(big-bang PIANO
          (to-draw show-it)
          (on-key key-press))