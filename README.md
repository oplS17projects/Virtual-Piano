# Virtual Piano

### Statement
For this project, we are implementing a virtual piano. The application will be interactive by allowing the users to play using their keyboards. Each key will correspond to a set of keys on a piano.

### Analysis
- Data Abstraction: We will be using list to contain the frequencies and only the objects (keys) can access it
- Recursion: We will use iterative recursion to calculate the frequencies needed.
- Map: We will use map to change the frequencies when the user wants to change the scale of they piano keys.
- Object Orientation: The keys will be implemented as objects
- Lazy Evaluation: We will be using the lazy evaluation approach to change the frequencies of the key. The idea is if the user is unsatisfied with how high/low the key sound, he/she can change the frequency to the next set by pressing a button, that way it doesn't get evaluated right away.


### External Technologies
The user's keyboard will act as a medium for detecting which key to play. The amount of keys able to be pressed is restricted by hardware.

### Data Sets or other Source Materials
N/A

### Deliverable and Demonstration
At the end of this project we will be having a fully functioning application that will accurately perform like a piano. This piano is interactive by allowing the users to use their keyboard to communicate with the piano and play music. At the live demo we will demonstrate by playing a song.

### Evaluation of Results
We will know how successful we are based on whether or not the program actually plays sounds when a certain key is pressed. It will be even more successful if we are able to implement changing which part of the piano keyboard is to be played.

## Architecture Diagram

![alt text](https://image.ibb.co/cr03bF/Diagram.png "Diagram")


## Schedule

### First Milestone (Sun Apr 9)
  - We will have the UI set up and connect each key to their corresponding block.
  - We will store the needed frequencies in a list using map

### Second Milestone (Sun Apr 16)
  - Align the frequencies to the keys and make sure the application plays the right note for each key. Highlight the block when a key is being pressed.
  - Adjust the frequencies in the list when the user wants to change the scale by pressing certain buttons
  
### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
 - Align key to new frequencies if users want to change frequencies. 

## Group Responsibilities

### Minh Nguyen @minhngu 
is responsible for UI and User Interaction

### Andrew Long @andrewzlong
is responsible for the sounds and the calculations behind them