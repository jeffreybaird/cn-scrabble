require_relative '../lib/output'

describe Output, "#scrabble board" do
  before do
    @output_boards = Output.new
    @board1 = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 
    [1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1], 
    [1, 2, "w", "h", "i", "f", "f", "l", "i", "n", "g", 1], 
    [2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1], 
    [1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1], 
    [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1], 
    [1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1], 
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2], 
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
    @board2 = ["2 "]
    @board3 = ["2 "]
    @board4 = ["1 "]
    @board5 = ["1 "]
    @board6 = ["1 "]
    @board7 = ["2 "]
    @board8 = ["1 "]
    @tiles = [
     "i4","w5","g6","f7","s2","e1","l3","h8","n1","f7",
     "b8","r12","u3","g6","i4","q9","o3","d2","s2","f7"]
    @output_boards.add_possible_board @board1
    @output_boards.add_possible_board @board2
    @output_boards.add_possible_board @board3
    @output_boards.add_possible_board @board4
    @output_boards.add_possible_board @board5
    @output_boards.add_possible_board @board6
    @output_boards.add_possible_board @board7
    @output_boards.add_possible_board @board8

  end
  
  it "returns an array" do
    @output_boards.output[0].should == @board1
  end
  
  it "has eight answers" do
    @output_boards.output.size.should == 8
  end
  
  it "formats the boards properly" do
   formatted_board =
"1 1 1 1 1 1 1 1 1 1 1 1 
 1 1 1 2 1 2 1 1 1 1 1 1 
 1 2 w h i f f l i n g 1 
 2 1 1 1 1 1 1 1 1 2 2 1 
 1 1 1 2 1 1 1 1 1 1 1 1 
 1 1 1 1 1 1 2 1 1 1 2 1 
 1 1 1 1 1 1 1 1 2 1 1 1 
 1 1 1 1 1 1 1 1 1 1 1 2 
 1 1 1 1 1 1 1 1 1 1 1 1"
  @output_boards.print_a_board(@board1).should == formatted_board
  end
  
  it "returns the numeric value of the puzzle" do
    @output_boards.numeric_value.should == 65
  end
  
  it "has a derived value" do
    @output_boards.tiles_to_hash
    w = @output_boards.return_a_value("w")
    h = @output_boards.return_a_value("h")
    i = @output_boards.return_a_value("i")
    f = @output_boards.return_a_value("f")
    l = @output_boards.return_a_value("l")
    n = @output_boards.return_a_value("n")
    g = @output_boards.return_a_value("g")
    @output_boards.numeric_value.should == w*1 + h*1 + i*1 + f*3 + f*1 + l*1 + i*1 + n*1 + g*2
  end
  it "turns words into a list of variables"
    
  
end