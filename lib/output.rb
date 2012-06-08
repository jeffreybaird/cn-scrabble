class Output
  attr_accessor :score
  def initialize word, y_axis, x_axis, score, orientation
    @orientation = orientation
    @word = word
    @length = word.length
    @y_axis = y_axis
    @x_axis = x_axis
    @score = score
  end
  
  def to_s
    "#{@word} at location #{@y_axis},#{@x_axis} (#{@orientation}) with a score of #{@score}\n"
  end
  
  def score_zero?
    @score == 0
  end
  
  def <=> (other)
    other.score <=> score
  end
  
  
  
  def print_out_a_word board
    if @orientation == 90
      print_horizontal_word(board)
    else
      print_vertical_word(board)
    end
  end
  
  def print_horizontal_word board
    board[@y_axis][@x_axis..@x_axis+@length] = @word.split('')
    board
  end
  
  def print_vertical_word board
    i = 0
    word = @word.split('')
    while i < @length
      board[@y_axis+i][@x_axis] = word[i]
      i += 1
    end
    board
  end
  
end

if __FILE__ == $0

end
