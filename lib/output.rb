class Output
  attr_reader :output, :letter_value_hash
  def initialize
    @output = []
    @tiles = [
     "i4","w5","g6","f7","s2","e1","l3","h8","n1","f7",
     "b8","r12","u3","g6","i4","q9","o3","d2","s2","f7"]
    @viable_words = Array.new
    @viable_words = ["whiffling","hen"]
  end
  
  def tiles_to_hash tiles
    @letter_value_hash = letter_as_value_hash(tiles)
  end
  
  def return_a_value(key)
    p @letter_value_hash[key]
  end
  
  def add_possible_board board
    @output.push(board)
  end
  def print_a_board board
    printed_board = []
    board.flatten.map do |x|
      printed_board.push(x)
    end
      
      printed_board.insert(12,"\n")
      printed_board.insert(25,"\n")
      printed_board.insert(38,"\n")
      printed_board.insert(51,"\n")
      printed_board.insert(64,"\n")
      printed_board.insert(77,"\n")
      printed_board.insert(90,"\n")
      printed_board.insert(103,"\n")
      printed_board.join(" ")
  end
  
  def numeric_value
    65
  end
  def letter_as_value_hash tiles
    Hash[tiles.map {|l| [l.slice(0), l.slice(1..3).to_i]}]
  end
  def word_as_value(viable_words) 
    viable_words.map do |word|
      word.split("").map {|c| @letter_value_hash[c]}
    end
  end
end

if __FILE__ == $0
  @output_new = Output.new
  @output_new.tiles_to_hash(@tiles)
  @output_new.return_a_value("w")
end
