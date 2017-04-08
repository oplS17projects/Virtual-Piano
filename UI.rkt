#lang racket
(require picturing-programs)
(define A (rectangle 80 300 "outline" "black"))
(define A1 (rectangle 80 300 "solid" "red"))
(define new (rectangle 50 200 "solid" "red"))
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

(define PIANO
  (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D E F G H)))

(define (display t)
  (place-image/align
   PIANO
   100 0
   "left" "top"
   (empty-scene 800 600)))

(define (key-press im k)
   (cond [(equal? k "a") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A1 B C D E F G H)))]
         [(equal? k "s") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A A1 C D E F G H)))]
         [(equal? k "d") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B A1 D E F G H)))]
         [(equal? k "f") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C A1 E F G H)))]
         [(equal? k "g") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D A1 F G H)))]
         [(equal? k "h") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D E A1 G H)))]
         [(equal? k "j") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A A C D E F A1 H)))]
         [(equal? k "k") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D E F G A1)))]
         [(equal? k "w") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  new 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D E F G H)))]
         [(equal? k "e") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy new 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D E F G H)))]
         [(equal? k "t") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy new 80 0
     (overlay/xy L 80 0 M)))) -50 0 (beside A B C D E F G H)))]
         [(equal? k "y") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy new 80 0 M)))) -50 0 (beside A B C D E F G H)))]
         [(equal? k "u") (set! PIANO (overlay/align/offset "left" "top" (overlay/xy  I 100 0 (overlay/xy J 140 0 (overlay/xy K 80 0
     (overlay/xy L 80 0 new)))) -50 0 (beside A B C D E F G H)))]
        [else im]))

(big-bang 0
          (to-draw display)
          (on-key key-press))