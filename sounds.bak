#lang racket
(require rsound)
(require rsound/piano-tones)

(define piano-key (list (piano-tone 60) (piano-tone 61) (piano-tone 62) '()))
(define piano-keys (list))
(define (create-initial start end)
  (if (<= start end)
       (begin ;used begin here to be able to call append and create-initial
         (set! piano-keys (append piano-keys (list (piano-tone start))))
         (create-initial (+ start 1) end))
       (set! piano-keys (append piano-keys '() ))))

(create-initial 48 60)
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

#| REFERENCE
To calculate rsound piano-tone number, take key number from
https://en.wikipedia.org/wiki/Piano_key_frequencies
and subtract 4.
Actual key numbers:
Middle C: 40, round 36
Tenor C: 52, rsound 48
Soprano C: 64, rsound 60




|#