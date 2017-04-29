# Virtual Piano

## Minh Nguyen
### April 28, 2017

# Overview
This set of code helps design an interactive user interface for the virtual piano. It is important
because it is responsible for the interactions between users and the application and between the
application and the UI thus dynamically updating the UI as the users give inputs.

The image files are abstracted by being stored in a list. Whenever an element is called it will be called
from a list not directly the varible names. Also the the design of the piano was done using the recursive
method.

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

## 1. Image files are stored in a list for ease of access and neater code

The following code defines the image files needed to design the UI and then put them in a list.

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


;Use a list to contain the image keys, that way it is easier to more neat to call a draw function
(define pianolist (list white-tile black-tile white-tile-pressed black-tile-pressed higher-note lower-note higher-pressed lower-pressed))

 ```

 ## 2. Step-by-step UI design
 
 The UI was designed followed step-by-step fashion so that anyone could read and be able to understand
 what it does
 
 ```
 ;Design the layout of black tiles.
(define draw-black-tiles
  (overlay/xy  (second pianolist) 100 0
               (overlay/xy (second pianolist) 140 0
                           (overlay/xy (second pianolist) 80 0
                                       (overlay/xy (second pianolist) 80 0
                                                   (second pianolist))))))

;Design the layout of white tiles.  
(define draw-white-tiles
  (beside (first pianolist) (first pianolist)(first pianolist)(first pianolist)(first pianolist)(first pianolist)(first pianolist)(first pianolist)))

;Putting the two together to get an complete piano
(define PIANO
  (overlay/align/offset "left" "top" draw-black-tiles -50 0 draw-white-tiles))

;Drawing background with PIANO
(define background
  (overlay (overlay/offset PIANO 450 0
                           (overlay/offset higher-note 0 100 lower-note))
           (rectangle 1000 500 "solid" "gray")))
```