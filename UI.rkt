#lang racket
(require picturing-programs)
(require rsound)
(require rsound/piano-tones)
;---------------------------SOUND DESIGN---------------------------
(define piano-keys (list))
(define start-tone 48)
(define end-tone 60)
;limits: 16 - 88 (actual)
;limits: 12 - 84 (rsound)

(define (increase-tone)
  (if (> (+  end-tone 12) 84)
       0
       (begin
         (set! start-tone (+ start-tone 12))
         (set! end-tone (+ end-tone 12))
         (set! piano-keys (list))
         (create-tones start-tone end-tone)
         )
  ))

(define (decrease-tone)
  (if (< (- start-tone 12) 12)
      0
      (begin
        (set! start-tone (- start-tone 12))
        (set! end-tone (- end-tone 12))
        (set! piano-keys (list))
        (create-tones start-tone end-tone)
        )
      ))


(define (create-tones start end)
  (if (<= start end)
       (begin
         (set! piano-keys (append piano-keys (list (piano-tone start))))
         (create-tones (+ start 1) end))
       (set! piano-keys (append piano-keys '() ))))

(create-tones start-tone end-tone)
;program starts off storing Tenor C to Soprano C, inclusive


(define (loop-through keys)
  (if (empty? keys)
      0
      (begin
        (play (first keys))
        (sleep 0.5)
        (stop)
        (loop-through (rest keys)))))

;(loop-through piano-keys)
;(increase-tone)
;(loop-through piano-keys)
;since there are no functions that alter piano-tones, we have to
;empty the list and recreate it with new piano-tones

#| REFERENCE
To calculate rsound piano-tone number, take key number from
https://en.wikipedia.org/wiki/Piano_key_frequencies
and subtract 4.
Actual key numbers:
Middle C: 40, rsound 36
Tenor C: 52, rsound 48
Soprano C: 64, rsound 60|#
;---------------------------END SOUND DESIGN---------------------------

;;---------------------------UI DESIGN---------------------------
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
   (cond [(equal? k "a") (begin
                           (play (list-ref piano-keys 0))
                           (white-pressed 150))]
         [(equal? k "s") (begin
                           (play (list-ref piano-keys 2))
                            (white-pressed 230))]
         [(equal? k "d") (begin
                           (play (list-ref piano-keys 4))
                           (white-pressed 310))]
         [(equal? k "f") (begin
                           (play (list-ref piano-keys 5))
                           (white-pressed 390))]
         [(equal? k "g") (begin
                           (play (list-ref piano-keys 7))
                           (white-pressed 470))]
         [(equal? k "h") (begin
                           (play (list-ref piano-keys 9))
                           (white-pressed 550))]
         [(equal? k "j") (begin
                           (play (list-ref piano-keys 11))
                           (white-pressed 630))]
         [(equal? k "k") (begin
                           (play (list-ref piano-keys 12))
                           (white-pressed 710))]
         [(equal? k "w") (begin
                           (play (list-ref piano-keys 1))
                           (black-pressed 180))]
         [(equal? k "e") (begin
                           (play (list-ref piano-keys 3))
                           (black-pressed 280))]
         [(equal? k "t") (begin
                           (play (list-ref piano-keys 6))
                           (black-pressed 420))]
         [(equal? k "y") (begin
                           (play (list-ref piano-keys 8))
                           (black-pressed 500))]
         [(equal? k "u") (begin
                           (play (list-ref piano-keys 10))
                           (black-pressed 580))]
        [else im]))


(big-bang background
          (to-draw show-it)
          (on-key key-press))

;---------------------------END UI DESIGN---------------------------



