require_relative '../lib/scrabble_board'
describe ScrabbleBoard, "#scrabble board" do
  
  before do
    @scrabble_game = Scrabble.new("bin/input.json")
    @board = ScrabbleBoard.new(@scrabble_game.board)
  end
  
  it "has a class called ScrabbleBoard" do
   p @board.class.should == ScrabbleBoard
  end
  
  it "Prints out a board as an array" do
    @board.should ==
     
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
    @board.convert_board_to_array.should ==
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
  

end
