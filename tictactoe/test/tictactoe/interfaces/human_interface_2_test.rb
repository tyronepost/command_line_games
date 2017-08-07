require_relative '../../test_helper'

class HumanInterface2Test < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
    @interface = HumanInterface2.new
  end

  def test_interface_2
    assert @interface
    @interface.set @board, "0", "X"
    assert_equal "X", @interface.get(@board, "0")
    assert_equal "X", @board.get(3, 1)

    @interface.set @board, "1", "X"
    assert_equal "X", @interface.get(@board, "1")
    assert_equal "X", @board.get(3, 2)

    @interface.set @board, "2", "X"
    assert_equal "X", @interface.get(@board, "2")
    assert_equal "X", @board.get(3, 3)

    @interface.set @board, "3", "X"
    assert_equal "X", @interface.get(@board, "3")
    assert_equal "X", @board.get(2, 1)

    @interface.set @board, "4", "X"
    assert_equal "X", @interface.get(@board, "4")
    assert_equal "X", @board.get(2, 2)

    @interface.set @board, "5", "X"
    assert_equal "X", @interface.get(@board, "5")
    assert_equal "X", @board.get(2, 3)

    @interface.set @board, "6", "X"
    assert_equal "X", @interface.get(@board, "6")
    assert_equal "X", @board.get(1, 1)

    @interface.set @board, "7", "X"
    assert_equal "X", @interface.get(@board, "7")
    assert_equal "X", @board.get(1, 2)

    @interface.set @board, "8", "X"
    assert_equal "X", @interface.get(@board, "8")
    assert_equal "X", @board.get(1, 3)

    assert @interface.set? @board, "8"

    assert @interface.valid? "0"
    assert !@interface.valid?("9")
  end

  def test_interface_coords
    last_move = @interface.interface_coords(Pair.new(1, 1))
    assert_equal "6", last_move
  end

  def test_valid_length
    assert @interface.valid_length?("0")
    assert !@interface.valid_length?("10")
  end
end