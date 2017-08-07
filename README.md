Command Line Games
================

Command Line Games is an application that features a number of games(Currently only tic tac toe is implemented) for 
children played through the command line interface.

Prerequisites
-------------
This game has only been tested for Ruby versions `>= 2.3.0`.

[Bundler.io](https://bundler.io) must be installed. Run
~~~
gem install bundler
~~~


Getting Started
-------------
To install the game run:

~~~ 
rake install
~~~

**Note: If any changes to the source code under /ticactoe, or /chess are made, `rake install` must be run again for those
changes to be reflected when the game is executed.

This will resolve all third party gem dependencies, and will package the chess and tictactoe projects into gems and
install them. These are dependencies for the command_line_games project.

To run automated tests run:
~~~
rake test
~~~

This will generate a coverage report which can be accessed from
~~~
coverage/index.html
~~~

To run the program run:
~~~
ruby bin/game.rb
~~~

How to play (Tic Tac Toe)
-----------

At the main menu, select the tictactoe option:

~~~
Welcome to Command Line Games!!!
----------------------------------
1: Chess (Incomplete)
2: Tic Tac Toe
3: Exit the program.

Please select which game you'd like to play: 
~~~
Currently the only playable game is Tic Tac Toe.
There are two interfaces for the player to interact with

~~~
   ______ ______ ______         ______ ______ ______ 
  |      |      |      |       |      |      |      |
A |      |      |      |       |  0   |  1   |  2   |
  |______|______|______|       |______|______|______|
  |      |      |      |       |      |      |      |
B |      |      |      |       |  3   |  4   |  5   |
  |______|______|______|       |______|______|______|
  |      |      |      |       |      |      |      |
C |      |      |      |       |  6   |  7   |  8   |
  |______|______|______|       |______|______|______|
      1      2      3                                

  ______________________       ______________________
             1                            2          
~~~

For interface 1, Enter (ROW)(COL) corresponding to the cell at the command prompt. For example:
~~~
A1, b2, C3
~~~

For interface 2, Enter the number that corresponds to the cell. For example:
~~~
1, 4, 8
~~~

Then select the game mode.
~~~
1: human vs computer
2: human vs human
3: computer vs computer
Please choose a game mode: 
~~~

Select a name for each player:
~~~
Enter name for Player 1: tyrone
~~~

Select a symbol for each player to use (traditionally X and O):
~~~
Select a game symbol for TYRONE (any character on your keyboard): 
~~~
For each computer player, a difficulty setting option will be available:
~~~
1: Easy
2: Medium
3: Hard
Select a difficulty setting for TYRONE (Computer): 3
~~~
Finally, before the game begins, choose which player goes first:
~~~
1:  Player 1 [TYRONE (Computer)]
2:  Player 2 [SHERRI (Computer)]
Select which player goes first: 1
~~~

Enjoy!

Issues
------
If you find a bug, please send the `log/game.log` to

[tyrone.post.a@gmail.com](mailto:tyrone.post.a@gmail.com)

along with a detailed explanation of the applications behavior.
