require 'json'
class Scrabble
  attr_accessor :tiles, :dictionary, :board
  
  def initialize filename
    @scrabble_hash = JSON.parse(File.read(filename))
    @tiles = @scrabble_hash[          "tiles"]
    @dictionary = @scrabble_hash["dictionary"]
    @board = @scrabble_hash[          "board"]
  end
  
  def tiles_to_values
    Hash[@tiles.map {|l| [l.slice(0), l.slice(1..3).to_i]}]
  end
  
  def available_letters 
    @tiles.map {|e| e[0]}
  end
  
  def pruned_words
    words = Array[@dictionary].flatten
    letters = available_letters
    letters.each {|e| words = words.map {|w| w.sub(e, '')}}
    @viable_words = words.each_with_index.collect {|w,k| @dictionary[k] if w==""}.compact
  end
      
  def words_as_values viable_words, letter_value_hash
    viable_words.map do |word|
      word.split("").map {|c| letter_value_hash[c]}
    end
  end
  
  def starting_points
    word_values = words_as_values(pruned_words, tiles_to_values)
    @letter_index = []  
    word_values.each_with_index.map do |word, k|
      array = []
      word.each_with_index.map do |letter, y|
        if letter > 4
          array << [k,y]
        end
      end
      @letter_index << array
    end
    @letter_index
  end
  
  def returns_a_letter word_index, char_index
    word = []
    word = pruned_words[word_index]
    word[char_index]
  end
  
  def place_a_word_horiz(board, word_index, y_axis, x_axis)
   word = words_as_values(pruned_words, tiles_to_values)
   value = 0
   word[word_index].each_with_index do |letter,i|
    raise "off the board" if board[y_axis][x_axis+i] == nil
    value += (letter*board[y_axis][x_axis+i])
   end
   value
  end
  
  def place_a_word_vert(board, word_index, y_axis, x_axis)
    word = words_as_values(pruned_words, tiles_to_values)
    value = 0
    word[word_index].each_with_index do |letter,i|
     value += (letter*board[y_axis+i][x_axis])
    end
    value
  end
end


if __FILE__ == $0
scrabble = Scrabble.new("../bin/input.json")
@valued_tiles = scrabble.tiles
@letter_value_hash = scrabble.tiles_to_values
@tiles = scrabble.tiles
p scrabble.board
dictionary = scrabble.dictionary
@letters = scrabble.available_letters
p @prunes = scrabble.pruned_words
@word_values = scrabble.words_as_values(scrabble.pruned_words, scrabble.tiles_to_values)
p @word_values
@test = scrabble.starting_points
p @test[0]
p scrabble.returns_a_letter(0,1)



# p scrabble.words_as_values(@prunes, @letter_value_hash)
end