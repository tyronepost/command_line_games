require_relative '../../test_helper'

class PairTest < Minitest::Test
  def test_pair
    @pair = Pair.new 1, 2
    assert_equal 1, @pair.row
    assert_equal 2, @pair.column
    assert_equal "row: 1, column: 2", @pair.to_s
  end
end