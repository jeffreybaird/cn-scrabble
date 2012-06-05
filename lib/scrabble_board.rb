require_relative 'scrabble.rb'
class ScrabbleBoard

attr_accessor :scrabble_board
 def initialize scrabble_board
   @scrabble_board = scrabble_board
 end

 def to_s
   
 end
 
 def convert_to_strings
   @array_of_strings = @scrabble_board.collect do |string|
     string = string.split
   end
 end
 
 def convert_board_to_array
   @board_of_integers = convert_to_strings.map do |array_array|
      array_array.map do |number_string|
        number_string.to_i
      end
   end
 end
 
end

if __FILE__ == $0
  @scrabble_game = Scrabble.new("../bin/input.json")
  @scrabble_board = ScrabbleBoard.new(@scrabble_game.board)
  p @scrabble_board
  @scrabble_board.convert_board_to_array
  @array_of_strings
end