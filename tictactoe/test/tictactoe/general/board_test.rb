require_relative '../../test_helper'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
  end

  def test_get_set
    assert_equal " ", @board.get(1, 1)
    assert @board.set(3, 1, "A")
    assert_equal "A", @board.get(3, 1)

    assert !@board.set(1, 4, "A")
    assert !@board.get(1, 4)
  end

  def test_full
    assert !@board.full?
    @board.set(1, 1, "A")
    assert !@board.full?
    @board.set(1, 2, "A")
    assert !@board.full?
    @board.set(1, 3, "A")
    assert !@board.full?
    @board.set(2, 1, "A")
    assert !@board.full?
    @board.set(2, 2, "A")
    assert !@board.full?
    @board.set(2, 3, "A")
    assert !@board.full?
    @board.set(3, 1, "A")
    assert !@board.full?
    @board.set(3, 2, "A")
    assert !@board.full?
    @board.set(3, 3, "A")
    assert @board.full?
  end

  def test_regression_1
    @board.set(3, 1, "X")
    @board.set(2, 2, "O")
    @board.set(3, 3, "X")
    @board.set(3, 2, "O")
    assert !@board.full?
  end

  def test_empty
    assert @board.empty?
    @board.set(1, 1, "X")
    assert !@board.empty?
  end
end
