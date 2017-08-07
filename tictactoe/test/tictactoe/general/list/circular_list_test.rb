require_relative '../../../test_helper'

class CircularListTest < Minitest::Test

  def setup
    @circular_list = CircularList.new
  end

  def test_insert
    @circular_list.insert 1
    assert_equal 1, @circular_list.current.data
    @circular_list.advance
    assert_equal 1, @circular_list.current.data

    @circular_list.insert 2
    assert_equal 1, @circular_list.current.data
    @circular_list.advance
    assert_equal 2, @circular_list.current.data

  end

  def test_find
    @circular_list.insert 1
    @circular_list.insert 2
    @circular_list.insert 2

    actual = @circular_list.find { |data| data == 2 }
    assert_equal 2, actual
  end

  def test_find_player
    player1 = Player.new name: "Player1", number: 1, behavior: nil, symbol: "X"
    player2 = Player.new name: "Player2", number: 2, behavior: nil, symbol: "O"

    @circular_list.insert player1
    @circular_list.insert player2

    winning_symbol = "X"
    actual = @circular_list.find { |data| data.symbol == winning_symbol }
    assert_equal player1, actual

    winning_symbol = "O"
    actual = @circular_list.find { |data| data.symbol == winning_symbol }
    assert_equal player2, actual
  end

  def test_next
    @circular_list.insert "1"
    @circular_list.insert "2"
    assert_equal "2", @circular_list.next.data
  end
end
