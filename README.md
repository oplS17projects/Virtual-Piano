# Virtual Piano

### Statement
For this project, we implemented a virtual piano. The application is interactive by allowing the users to play music using their keyboards. Each key corresponds to a note on the piano. This project was interesting because both of us are exposed to the instrument and it would be fun to build one ourselves.

### Analysis
- Data Abstraction: We used lists to contain the frequencies and images. Only the objects (keys) can access it
- Recursion: We used iterative recursion to calculate the frequencies needed.
- Map: We used map to change the frequencies when the user wants to change the scale of they piano keys.
- Object Orientation: The keys were implemented as objects
- Lazy Evaluation: We used the lazy evaluation approach to change the frequencies of the key. The idea is if the user is unsatisfied with how high/low the key sound, he/she can change the frequency to the next set by pressing a button, that way it doesn't get evaluated right away.


### External Technologies
The user's keyboard acts as a medium for detecting which key to play. The amount of keys able to be pressed is restricted by hardware.

### Deliverable and Demonstration
At the end of this project we had a fully functioning application that accurately performs like a piano. This piano is interactive by allowing the users to use their keyboard to communicate with the User Interface and play music. At the live demo we will demonstrate by playing a song.

### Evaluation of Results
We know how successful the application is based on whether or not the program actually plays sounds when a certain key is pressed. It is even more successful that we were able to implement changing which part of the piano keyboard is to be played.

## Architecture Diagram

![alt text](https://image.ibb.co/cr03bF/Diagram.png "Diagram")


## Schedule

### First Milestone (Sun Apr 9)
  - We had the UI set up and connect each key to their corresponding block.
```racket
	; Create image blocks
	(define white-tile (rectangle 80 300 "outline" "black"))
	(define black-tile (rectangle 50 200 "solid" "black"))
	(define white-tile-pressed (square 50 "solid" "black"))
	(define black-tile-pressed (rectangle 50 200 "solid" "white"))
	(define pianolist (list white-tile black-tile white-tile-pressed black-tile-pressed))

	; Design the Piano 
	;Design the layout of black tiles.
	(define draw-black-tiles
	  (overlay/xy  (second pianolist) 100 0
		(overlay/xy (second pianolist) 140 0
			(overlay/xy (second pianolist) 80 0
				(overlay/xy (second pianolist) 80 0
				   (second pianolist))))))

	;Design the layout of white tiles.  
	(define draw-white-tiles
	  (beside (first pianolist) (first pianolist)(first pianolist)(first pianolist)
		(first pianolist)(first pianolist)(first pianolist)(first pianolist)))

	;Putting the two together to get an complete piano
	(define PIANO
		(overlay/align/offset "left" "top" draw-black-tiles -50 0 draw-white-tiles))
```

  - We stored the needed frequencies in a list using map
```racket
	(define (create-tones start end)
		(if (<= start end)
			(begin
				(set! piano-keys (append piano-keys (list (piano-tone start))))
				(create-tones (+ start 1) end))
				(set! piano-keys (append piano-keys '() ))))
```

### Second Milestone (Sun Apr 16)
  - Aligned the frequencies to the keys and make sure the application plays the right note for each key. Highlight the block when a key is being pressed.
  
```racket
	
	;Big bang function that controls everything, start universe.
	(big-bang background
	  (to-draw show-it)
	  (on-key key-press)
	  (on-release key-release))
	  
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
         ...
		 
```
  - Adjusted the frequencies in the list when the user wants to change the scale by pressing certain buttons
```racket
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
```
### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
  - Aligned key to new frequencies if users want to change frequencies. 

```racket
	[(equal? k "up") (begin
						(increase-tone)
						(add-frequency 866))]
	[(equal? k "down") (begin
						(decrease-tone)
						(lower-frequency 866))]
```  
## Group Responsibilities

### Minh Nguyen @minhngu 
is responsible for UI and Interaction

### Andrew Long @andrewzlong
is responsible for the sounds and the calculations behind them
