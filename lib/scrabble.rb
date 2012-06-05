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
end

if __FILE__ == $0
scrabble = Scrabble.new("../bin/input.json")
@valued_tiles = scrabble.tiles
@letter_value_hash = scrabble.tiles_to_values
@tiles = scrabble.tiles
dictionary = scrabble.dictionary
@letters = scrabble.available_letters
@prunes = scrabble.pruned_words
@word_values = scrabble.words_as_values(scrabble.pruned_words, scrabble.tiles_to_values)
p @word_values
# p scrabble.words_as_values(@prunes, @letter_value_hash)
end