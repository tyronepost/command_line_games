require_relative '../../../test_helper'

class RandomSpaceSelectorTest < Minitest::Test
  def setup
    @board = Board.new(size: 3, default: " ")
    @random_space_selector = RandomSpaceSelector.new
  end

  def test_random_space
    pair = @random_space_selector.random_space(@board)
    assert pair.is_a?(Pair)
    assert (1..3).include?(pair.row)
    assert (1..3).include?(pair.column)
  end
end
