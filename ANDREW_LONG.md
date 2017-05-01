# Virtual Piano

## Andrew Long
### April 30, 2017

### Overview
This set of code is used to generate sounds that resemble the actual sounds played by a piano. The ```rsound``` library comes built-in with a procedure that returns an rsound, which contains a recording of a piano note at the given key number.

### Libraries Used
The code used two libraries:
```
(require rsound)
(require rsound/piano-tones
```

- The ```rsound``` library is used to create and play sounds. These sounds can either be built-in to the library or generated given frequencies.
- The ```rsound/piano-tones``` library is used to create sounds that resemble the actual sounds from a piano.

## Key Code Excerpts

### 1. Using recursion to generate a list of piano tones
The following code uses iterative recursion and append to create a list of piano tones, then returns the list when thirteen piano tones have been created.

```
(define (create-tones start end lst)
  (if (<= start end)
      (create-tones (+ start 1) end (append lst (list (piano-tone start))))
      lst ))
```

The function ```create-tones``` takes in three arguments: ```start```, ```end```, and ```lst```. ```start``` is the value of the piano-tone that is added to ```lst```, a list holding the piano-tones, and ```end``` tells the program when to stop as we increment ```start```.

The ```create-tones``` function is called once during the main body of the program to generate the initial list of piano-tones, and called in the ```increase-tone``` and ```decrease-tone``` functions.

### 2. Changing the octaves at which sounds are played
The following code changes which sounds are played by the system by either increasing or decreasing global variables and generating a new list of piano tones using these values.

```
(define (increase-tone)
  (if (> (+  end-tone 12) 84)
       0
       (begin
         (set! start-tone (+ start-tone 12))
         (set! end-tone (+ end-tone 12))
         (set! piano-keys (create-tones start-tone end-tone '() )))))

(define (decrease-tone)
  (if (< (- start-tone 12) 12)
      0
      (begin
        (set! start-tone (- start-tone 12))
        (set! end-tone (- end-tone 12))
        (set! piano-keys (create-tones start-tone end-tone '() )))))
```

### 3. Dynamically changing the state of a key/sound with users' inputs
The following code detects key presses from the user's keyboards and performs actions based on which key is pressed. Certain letter keys will play piano sounds, while the up/down arrows will increase/decrease the octaves at which the sounds are played.
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

Most of this code was written by my partner Minh Nguyen. I simply added the parts where ```increase-tone``` and ```decrease-tone``` are called as well as the ```play``` function.
