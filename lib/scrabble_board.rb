require_relative 'scrabble.rb'
class ScrabbleBoard

 def initialize scrabble_hash
   @scrabble_hash = scrabble_hash
 end
 
end

if __FILE__ == $0
  @scrabble_game = Scrabble.new("../bin/input.json")
  p @scrabble_game.board
end