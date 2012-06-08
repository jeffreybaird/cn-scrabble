require_relative "../lib/scrabble"
@game = Scrabble.new("input.json")
@board = ScrabbleBoard.new(@game.board)
@board = @board.convert_board_to_array
@output = @game.print_out_each_word(@board, @game.print_top_eight(@board))

def print_final_answer(to_file="FINAL_OUTPUT.txt")
  File.open(to_file, "w") do |file|
    file.puts @output
  end
end

print_final_answer("FINAL_OUTPUT.txt")