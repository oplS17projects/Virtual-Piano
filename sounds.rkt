#lang racket
(require rsound)
(require rsound/piano-tones)

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
         (create-initial start-tone end-tone)
         )
  ))

(define (decrease-tone)
  (if (< (- start-tone 12) 12)
      0
      (begin
        (set! start-tone (- start-tone 12))
        (set! end-tone (- end-tone 12))
        (set! piano-keys (list))
        (create-initial start-tone end-tone)
        )
      ))


(define (create-initial start end)
  (if (<= start end)
       (begin
         (set! piano-keys (append piano-keys (list (piano-tone start))))
         (create-initial (+ start 1) end))
       (set! piano-keys (append piano-keys '() ))))

(create-initial start-tone end-tone)
;program starts off storing Tenor C to Soprano C, inclusive


(define (loop-through keys)
  (if (empty? keys)
      0
      (begin
        (play (first keys))
        (sleep 0.5)
        (stop)
        (loop-through (rest keys)))))

(loop-through piano-keys)
(increase-tone)
(loop-through piano-keys)
;since there are no functions that alter piano-tones, we have to
;empty the list and recreate it with new piano-tones

#| REFERENCE
To calculate rsound piano-tone number, take key number from
https://en.wikipedia.org/wiki/Piano_key_frequencies
and subtract 4.
Actual key numbers:
Middle C: 40, rsound 36
Tenor C: 52, rsound 48
Soprano C: 64, rsound 60




|#