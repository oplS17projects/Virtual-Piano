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

; Creating images
(define white-key (rectangle 80 300 "outline" "black"))
(define black-key (rectangle 50 200 "solid" "black"))
(define white-key-pressed (square 50 "solid" "black"))
(define black-key-pressed (rectangle 50 200 "solid" "white"))
(define higher (overlay
                (rectangle 30 75 "solid" "black")
                (rectangle 75 30 "solid" "black")))
(define lower (rectangle 75 30 "solid" "black"))
(define higher-pressed (overlay
                (rectangle 30 75 "solid" "red")
                (rectangle 75 30 "solid" "red")))
(define lower-pressed (rectangle 75 30 "solid" "red"))


;Design the PIANO
(define PIANO
  (overlay/align/offset "left" "top" (overlay/xy  black-key 100 0 (overlay/xy black-key 140 0 (overlay/xy black-key 80 0
     (overlay/xy black-key 80 0 black-key)))) -50 0 (beside white-key white-key white-key white-key white-key white-key white-key white-key)))


;Drawing background with PIANO
(define background
  (overlay (overlay/offset PIANO 450 0 (overlay/offset higher 0 100 lower))
           (rectangle 1000 500 "solid" "gray")))

;When white key is pressed
(define (white-pressed t)
  (place-image/align white-key-pressed
                     t 330
                     "left" "top"
                     background))

;When black key is pressed
(define (black-pressed t)
  (place-image/align black-key-pressed
                     t 100
                     "left" "top"
                     background))

;When nothing is pressed
(define (nothing-pressed t)
  (place-image background
               t 0
               (rectangle 900 500 "solid" "gray")))

;When going to higher note
(define (add-frequency t)
  (place-image higher-pressed
               t 211
               background))

;When going to lower note
(define (lower-frequency t)
  (place-image lower-pressed
               t 311
               background))

;Event handler when key is not pressed, return to the original state. Work-in-progress
(define (key-release t)
   (place-image background
               0 0
               (rectangle 900 500 "solid" "gray")))

;Main event handler, check for key pressed, then perform to the corresponding function
(define (key-press im k)
   (cond [(equal? k "a") (begin
                           (play (list-ref piano-keys 0))
                           (white-pressed 116))]
         [(equal? k "s") (begin
                           (play (list-ref piano-keys 2))
                            (white-pressed 196))]
         [(equal? k "d") (begin
                           (play (list-ref piano-keys 4))
                           (white-pressed 276))]
         [(equal? k "f") (begin
                           (play (list-ref piano-keys 5))
                           (white-pressed 356))]
         [(equal? k "g") (begin
                           (play (list-ref piano-keys 7))
                           (white-pressed 431))]
         [(equal? k "h") (begin
                           (play (list-ref piano-keys 9))
                           (white-pressed 511))]
         [(equal? k "j") (begin
                           (play (list-ref piano-keys 11))
                           (white-pressed 591))]
         [(equal? k "k") (begin
                           (play (list-ref piano-keys 12))
                           (white-pressed 671))]
         [(equal? k "w") (begin
                           (play (list-ref piano-keys 1))
                           (black-pressed 146))]
         [(equal? k "e") (begin
                           (play (list-ref piano-keys 3))
                           (black-pressed 246))]
         [(equal? k "t") (begin
                           (play (list-ref piano-keys 6))
                           (black-pressed 386))]
         [(equal? k "y") (begin
                           (play (list-ref piano-keys 8))
                           (black-pressed 466))]
         [(equal? k "u") (begin
                           (play (list-ref piano-keys 10))
                           (black-pressed 546))]
         [(equal? k "up") (begin
                            (increase-tone)
                           (add-frequency 866))]
         [(equal? k "down") (begin
                              (decrease-tone)
                           (lower-frequency 866))]
        [else background]))

;Big bang function that controls everything, start universe.
(big-bang background
          (to-draw show-it)
          (on-key key-press))

;---------------------------END UI DESIGN---------------------------


