# Chess
The goal of this project is to create a command line chess game in Ruby.

## About
* The game is properly constrained – it prevents players from making illegal moves and declares check mate or stalemate in the correct situations.
* All chess moves, including castling for the king and en passant capture for pawns, are supported.
* There are two different game modes - one where 2 players can play against each other, and another where a player can play against the computer.
* The computer AI makes a random legal move on each turn, excluding en passant and castling moves.
* The game allows the player to save the current game at any point to one of five save files, and load a save game on launch. The save files are serialized using the Ruby marshaling library.
* All of the main move-checking methods have been tested with RSpec in a variety of different scenarios to ensure proper functionality. The test files are included in the repository for those interested.

## Instructions and useful info
* To play, clone this repository and run `$ ruby lib/chess.rb` in the command line from the project directory (note: you must have Ruby installed)
* You have a choice of two game modes, Player vs Player and Player vs Computer. All of the following information applies for both game modes.
* The game uses unicode chess symbols: ♔♕♖♗♘♙ for white and ♚♛♜♝♞♟︎ for black. In order to see the chess board properly, it is recommended that you set your command line font size to at least 30px. If you are using a black background/white text command line interface, the colours will appear opposite to what they really are, as the unicode symbols were assigned with white background/black text in mind.
* Moves are made by entering chess grid coordinates (eg. `B7`) when prompted. It does not matter whether these are uppercase or lowercase.
* All chess moves are supported. Enemy chess pieces are automatically removed from the board. 
* To make a castling move, simply move the king to the grid square it would end up in after the move - if valid, the appropriate rook will automatically move to the correct position.
* To make an en passant capture, simply move your pawn to the grid square it would end up in after the move - if valid, the appropriate enemy pawn will be automatically removed.
* You can save the current game by typing `save` (case doesn't matter) instead of a coordinate at any point. You can choose one of five save files. Please be aware that if you choose to save to a file with save data already on it the previous save data will be overwritten.
* Saved games can be loaded on startup of the game. The play then resumes at the turn that the game was saved.
