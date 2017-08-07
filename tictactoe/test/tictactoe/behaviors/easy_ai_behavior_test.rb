require_relative '../../test_helper'

class EasyAIBehaviorTest < Minitest::Test
  def setup
    @default = " "
    @board = Board.new size: 3, default: @default
    @behavior = EasyAIBehavior.new
  end

  def test_play
    assert !@board.full?
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "X"
    assert @board.full?
  end
end