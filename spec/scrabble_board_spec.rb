require_relative '../lib/scrabble_board'
describe ScrabbleBoard, "#scrabble board" do
  
  before do
    @game = Scrabble.new("bin/input.json")
    @board = ScrabbleBoard.new(@game.board)
    @array_board = @board.convert_board_to_array
  end
  
  it "has a class called ScrabbleBoard" do
   p @board.class.should == ScrabbleBoard
  end
  
  it "Prints out a board as an array" do
    @board.to_s.should ==
     
    ["1 1 1 1 2 1 1 1 3 1 1 1",
     "1 1 1 1 4 1 1 1 1 2 1 2",
     "1 1 1 1 1 1 1 1 1 1 1 1",
     "1 2 1 2 1 1 1 1 1 1 1 1",
     "1 1 1 1 1 1 1 1 1 3 1 3",
     "1 1 1 1 1 1 1 1 1 1 1 1", 
     "1 3 1 1 1 1 1 2 2 2 1 1", 
     "1 1 1 2 1 2 1 1 1 1 1 2", 
     "1 1 1 1 1 1 1 1 1 1 1 1"]
    
  end
  
  it "Becomes and array of arrays" do
    @array_board.should ==
    [[1, 1, 1, 1, 2, 1, 1, 1, 3, 1, 1, 1],
     [1, 1, 1, 1, 4, 1, 1, 1, 1, 2, 1, 2],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
     [1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 3],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
     [1, 3, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1], 
     [1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2], 
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
  end
  it "Returns the coordinates of all spaces > 1" do
    @board.index_of_best_spaces[0].should ==  [0,4]
  end
  
  it "places a word starting at [0][3] going right and calculates the value" do
    @game.place_a_word_horiz(@array_board,0,0,3).should == 56
  end
  
  it "places a word vertically" do
    @game.place_a_word_vert(@array_board,0,0,4).should == 62
  end
  
  it "returns 0 if it is off the board horizontally" do
    @game.place_a_word_horiz(@array_board,0,0,7).should == 0
  end
  
  it "returns 0 if it is off the board vertically" do
    @game.place_a_word_vert(@array_board,0,8,0).should == 0
  end
  
  it "places a word on every spot on the board" do
    @game.word_on_board(@array_board, 0).flatten.pop.should == 63
  end
  
end
