require_relative 'scrabble'
class Output
  attr_reader :output, :letter_value_hash
  def initialize scrabble_tiles
    @tiles = scrabble_tiles
  end
  
end

if __FILE__ == $0
  @output_new = Output.new("../bin/input.json")
end
