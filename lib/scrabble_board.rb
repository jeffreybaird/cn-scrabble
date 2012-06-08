require_relative 'output'
class ScrabbleBoard

attr_accessor :scrabble_board
 def initialize scrabble_board
   @scrabble_board = scrabble_board
 end

 def to_s
   scrabble_board
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
 
 def index_of_best_spaces
  @space_index = []
  convert_board_to_array.each_with_index.map do |array, k|
    array.each_with_index.map do |space, y|
      if space.to_i > 1
        @space_index << [k,y]
      end
    end
  end  
    @space_index
 end

end

if __FILE__ == $0

end