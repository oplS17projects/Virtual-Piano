# Virtual Piano

### Statement
For this project, we are implementing a virtual piano. The application will be interactive by allowing the users to play using their keyboards. Each key will correspond to a set of keys on a piano.

### Analysis
Explain what approaches from class you will bring to bear on the project.

Be explicit about the techiques from the class that you will use. For example:
- Will you use data abstraction? How?
- Will you use recursion? We will use iterative recursion to calculate the frequencies needed.
- Will you use map/filter/reduce? We will use map to change the contents of a list that holds the frequencies when the user wants to change the scale of they piano keys.
- Will you use object-orientation? How?
- Will you use functional approaches to processing your data? How?
- Will you use state-modification approaches? How? (If so, this should be encapsulated within objects. `set!` pretty much should only exist inside an object.)
- Will you build an expression evaluator, like we did in the symbolic differentatior and the metacircular evaluator?
- Will you use lazy evaluation approaches?

The idea here is to identify what ideas from the class you will use in carrying out your project. 

**Your project will be graded, in part, by the extent to which you adopt approaches from the course into your implementation, _and_ your discussion about this.**

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
UI
  - We will have the UI set up and connect each key to their corresponding block.

### Second Milestone (Sun Apr 16)
UI
  - Align the frequencies to the keys and make sure the application plays the right note for each key. Highlight the block when a key is being pressed.
### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
What additionally will be completed before the public presentation?

## Group Responsibilities

### Minh Nguyen @minhngu 
is responsible for UI and User Interaction

### Andrew Long @andrewzlong
is responsible for the sounds and the calculations behind them
