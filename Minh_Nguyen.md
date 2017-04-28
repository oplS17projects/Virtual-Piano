# Virtual Piano

## Minh Nguyen
### April 28, 2017

# Overview
This set of code helps design an interactive user interface for the virtual piano. It is important
because it is responsible for the interactions between users and the application and between the
application and the UI.

The image files are abstracted by being stored in a list. Whenever an element is called it will be called
from a list not directly the varible names. 

Also the it draws the piano keys by using recursive methods.

**Authorship note:** All of the code described here was written by myself.

# Libraries Used
The code uses four libraries:

```
(require 2htdp/universe)
(require 2htdp/images)
```

* The ```2htdp/universe``` library provide the ability to interact between user and the application.
* The ```2htdp/images``` library provides the ability to draw images. 


# Key Code Excerpts

## 1. Storing images files in a list for ease of access and neater code

The following code creates images files needed to design the PIANO and then put them in a list
so that it will be easier to access and called.

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

 