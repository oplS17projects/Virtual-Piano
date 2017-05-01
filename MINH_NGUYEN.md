# Virtual Piano

## Minh Nguyen
### April 28, 2017

# Overview
This set of code helps design an interactive user interface for the virtual piano. It is important
because it is responsible for the interactions between users and the application and between the
application and the UI thus dynamically updating the UI as the users give their inputs.


**Authorship note:** All of the code described here was written by myself.

# Libraries Used
The code uses two libraries:

```
(require 2htdp/universe)
(require 2htdp/images)
```

* The ```2htdp/universe``` library provide the ability to interact between the users and the application.
* The ```2htdp/images``` library provides the ability to draw images. 


# Key Code Excerpts

## 1. Image files are stored in a list for ease of access

The following code defines the image files that are needed to design the UI. The image files are abstracted by being stored in a list.
Whenever an element is needed it will be called via the list but not directly from the variable names.

```
; Creating images
(define white-tile (rectangle 80 300 "outline" "black"))
(define black-tile (rectangle 50 200 "solid" "black"))
(define white-tile-pressed (square 50 "solid" "black"))
(define black-tile-pressed (rectangle 50 200 "solid" "white"))
(define higher-note (overlay
                    (rectangle 30 75 "solid" "black")
                    (rectangle 75 30 "solid" "black")))
(define lower-note (rectangle 75 30 "solid" "black"))
(define higher-pressed (overlay
                       (rectangle 30 75 "solid" "red")
                       (rectangle 75 30 "solid" "red")))
(define lower-pressed (rectangle 75 30 "solid" "red"))


;Use a list to contain the image keys
(define pianolist (list white-tile black-tile white-tile-pressed black-tile-pressed 
                        higher-note lower-note higher-pressed lower-pressed))

 ```

 ## 2. Easy to follow UI design
 
 The UI was designed followed a step-by-step fashion so that anyone could read and be able to understand
 what it does. Also note that all elements called were being access via the list but never the elements itself.
 
 ```
 ;Draw the black tiles.
(define draw-black-tiles
  (overlay/xy  (second pianolist) 100 0
               (overlay/xy (second pianolist) 140 0
                           (overlay/xy (second pianolist) 80 0
                                       (overlay/xy (second pianolist) 80 0
                                                   (second pianolist))))))

;Draw the white tiles.  
(define draw-white-tiles
  (beside (first pianolist) (first pianolist)(first pianolist)(first pianolist)
            (first pianolist)(first pianolist)(first pianolist)(first pianolist)))

;Putting the two together to get an complete piano layout
(define PIANO
  (overlay/align/offset "left" "top" draw-black-tiles -50 0 draw-white-tiles))

;Put the completed piano on a background
(define background
  (overlay (overlay/offset PIANO 450 0
                           (overlay/offset higher-note 0 100 lower-note))
           (rectangle 1000 500 "solid" "gray")))
```


## 3. Dynamically changing the state of a key/sound with users' inputs


The following code run the users inputs from the keys then compare it with characters and if it matches then it will move the block
to the corresponding key and highlight that key and also play the sound thus creating an interactive UI.


```
(define (key-press im k)
   (cond [(equal? k "a") (begin
                           (play (list-ref piano-keys 0))
                           (white-pressed 116))]
         [(equal? k "s") (begin
                           (play (list-ref piano-keys 2))
                           (white-pressed 196))]
    .......
         [(equal? k "up") (begin
                            (increase-tone)
                            (add-frequency 866))]
         [(equal? k "down") (begin
                              (decrease-tone)
                              (lower-frequency 866))]
         [else background]))

```

When the user inputs match the characters it will jump to these functions depending which key is being pressed.
The logic is simple, if a white tile is pressed, it will highlight that key by moving a colored block on top of that key.

```
;When white tile is pressed
(define (white-pressed t)
  (place-image/align (third pianolist)
                     t 330
                     "left" "top"
                     background))

;When black tile is pressed
(define (black-pressed t)
  (place-image/align (fourth pianolist)
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
```

