require_relative '../../test_helper'

class MediumAIBehaviorTest < Minitest::Test
  def setup
    @default = " "
    @board = Board.new size: 3, default: @default
    @behavior = MediumAIBehavior.new
  end

  def test_play_empty_board
    assert_equal @default, @board.get(2, 2)
    @behavior.play nil, @board, "X"
    assert_equal "X", @board.get(2, 2)
  end

  def test_random
    @behavior.play nil, @board, "X"
    @behavior.play nil, @board, "O"
  end

  def test_play_with_imminent_win
    @board.set 1, 1, "X"
    @board.set 1, 2, "X"
    assert_equal @default, @board.get(1, 3)
    @behavior.play nil, @board, "X"
    assert_equal "X", @board.get(1, 3)
  end
end
