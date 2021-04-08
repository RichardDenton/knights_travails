# Knight's Travails
Project created in Ruby as part of the Odin Project's [Curriculum](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails) to practice with searching.

The program takes a start position and a target position for a knight on an 8 x 8 chessboard and shows what the quickest route is from the start position to the target position. 

The approach I used was to use a depth first search to visit each square on the board that is reachable from the current square (starting from the start position) and recording the parent square
of each square that is visited until the target square is reached. Once the target square is reached the shortest path is found by working back up the path through each parent node until getting 
back to the start position.

## Running the project
To run the project run lib/knights_travils.rb in Ruby.
