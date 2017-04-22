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

### Data Sets or other Source Materials
N/A

### Deliverable and Demonstration
At the end of this project we had a fully functioning application that accurately performs like a piano. This piano is interactive by allowing the users to use their keyboard to communicate with the User Interface and play music. At the live demo we will demonstrate by playing a song.

### Evaluation of Results
We know how successful the application is based on whether or not the program actually plays sounds when a certain key is pressed. It is even more successful that we were able to implement changing which part of the piano keyboard is to be played.

## Architecture Diagram

![alt text](https://image.ibb.co/cr03bF/Diagram.png "Diagram")


## Schedule

### First Milestone (Sun Apr 9)
  - We had the UI set up and connect each key to their corresponding block.
  - We stored the needed frequencies in a list using map

### Second Milestone (Sun Apr 16)
  - Aligned the frequencies to the keys and make sure the application plays the right note for each key. Highlight the block when a key is being pressed.
  - Adjusted the frequencies in the list when the user wants to change the scale by pressing certain buttons
  
### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
  - Aligned key to new frequencies if users want to change frequencies. 

## Group Responsibilities

### Minh Nguyen @minhngu 
is responsible for UI and Interaction

### Andrew Long @andrewzlong
is responsible for the sounds and the calculations behind them
