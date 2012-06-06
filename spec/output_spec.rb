require_relative '../lib/output'

describe Output, "#scrabble board" do
  before do
    @game = Scrabble.new("bin/input.json")
    @tiles = Output.new(@game.tiles)
  end

end