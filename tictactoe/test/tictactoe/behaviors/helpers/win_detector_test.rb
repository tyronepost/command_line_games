require_relative '../../../test_helper'

class WinDetectorTest < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
    @win_detector = WinDetector.new
  end

  def test_initialize
    assert @win_detector
  end

  def test_imminent_win_row_1_1
    @board.set(1, 1, "X")
    @board.set(1, 2, "X")
    assert_winning_pair(1, 3)
  end

  def test_imminent_win_row_1_2
    @board.set(1, 2, "X")
    @board.set(1, 3, "X")
    assert_winning_pair(1, 1)
  end

  def test_imminent_win_row_1_3
    @board.set(1, 1, "X")
    @board.set(1, 3, "X")
    assert_winning_pair(1, 2)
  end

  def test_imminent_win_row_2_1
    @board.set(2, 1, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(2, 3)
  end

  def test_imminent_win_row_2_2
    @board.set(2, 2, "X")
    @board.set(2, 3, "X")
    assert_winning_pair(2, 1)
  end

  def test_imminent_win_row_2_3
    @board.set(2, 1, "X")
    @board.set(2, 3, "X")
    assert_winning_pair(2, 2)
  end

  def test_imminent_win_row_3_1
    @board.set(3, 1, "X")
    @board.set(3, 2, "X")
    assert_winning_pair(3, 3)
  end

  def test_imminent_win_row_3_2
    @board.set(3, 2, "X")
    @board.set(3, 3, "X")
    assert_winning_pair(3, 1)
  end

  def test_imminent_win_row_3_3
    @board.set(3, 1, "X")
    @board.set(3, 3, "X")
    assert_winning_pair(3, 2)
  end

  def test_imminent_win_col_1_1
    @board.set(1, 1, "X")
    @board.set(2, 1, "X")
    assert_winning_pair(3, 1)
  end

  def test_imminent_win_col_2_1
    @board.set(2, 1, "X")
    @board.set(3, 1, "X")
    assert_winning_pair(1, 1)
  end

  def test_imminent_win_col_3_1
    @board.set(1, 1, "X")
    @board.set(3, 1, "X")
    assert_winning_pair(2, 1)
  end

  def test_imminent_win_col_1_2
    @board.set(1, 2, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(3, 2)
  end

  def test_imminent_win_col_2_2
    @board.set(3, 2, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(1, 2)
  end

  def test_imminent_win_col_3_2
    @board.set(3, 2, "X")
    @board.set(1, 2, "X")
    assert_winning_pair(2, 2)
  end

  def test_imminent_win_col_1_3
    @board.set(1, 3, "X")
    @board.set(2, 3, "X")
    assert_winning_pair(3, 3)
  end

  def test_imminent_win_col_2_3
    @board.set(1, 3, "X")
    @board.set(3, 3, "X")
    assert_winning_pair(2, 3)
  end

  def test_imminent_win_col_3_3
    @board.set(2, 3, "X")
    @board.set(3, 3, "X")
    assert_winning_pair(1, 3)
  end

  def test_imminent_win_diag_1
    @board.set(1, 1, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(3, 3)
  end

  def test_imminent_win_diag_2
    @board.set(3, 3, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(1, 1)
  end

  def test_imminent_win_diag_3
    @board.set(3, 3, "X")
    @board.set(1, 1, "X")
    assert_winning_pair(2, 2)
  end

  def test_imminent_win_diag_4
    @board.set(1, 3, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(3, 1)
  end

  def test_imminent_win_diag_5
    @board.set(3, 1, "X")
    @board.set(2, 2, "X")
    assert_winning_pair(1, 3)
  end

  def test_imminent_win_diag_6
    @board.set(3, 1, "X")
    @board.set(1, 3, "X")
    assert_winning_pair(2, 2)
  end

  def test_imminent_win_for_self_row_1_1
    @board.set(1, 2, "X")
    @board.set(1, 3, "X")
    assert_winning_pair_for_self(1, 1, "X")
  end

  def test_imminent_win_for_self_row_1_2
    @board.set(1, 1, "X")
    @board.set(1, 3, "X")
    assert_winning_pair_for_self(1, 2, "X")
  end

  def test_imminent_win_for_self_row_1_3
    @board.set(1, 1, "X")
    @board.set(1, 2, "X")
    assert_winning_pair_for_self(1, 3, "X")
  end

  def test_imminent_win_for_self_column_1_1
    @board.set(3, 1, "X")
    @board.set(2, 1, "X")
    assert_winning_pair_for_self(1, 1, "X")
  end

  def test_imminent_win_for_self_column_2_1
    @board.set(3, 1, "X")
    @board.set(1, 1, "X")
    assert_winning_pair_for_self(2, 1, "X")
  end

  def test_imminent_win_for_self_column_3_1
    @board.set(1, 1, "X")
    @board.set(2, 1, "X")
    assert_winning_pair_for_self(3, 1, "X")
  end

  def test_imminent_win_for_self_diagonal_3_3
    @board.set(1, 1, "X")
    @board.set(2, 2, "X")
    assert_winning_pair_for_self(3, 3, "X")
  end

  def test_imminent_win_for_self_diagonal_1_1
    @board.set(3, 3, "X")
    @board.set(2, 2, "X")
    assert_winning_pair_for_self(1, 1, "X")
  end

  def test_imminent_win_for_self_diagonal_2_2_bottom_to_top
    @board.set(1, 1, "X")
    @board.set(3, 3, "X")
    assert_winning_pair_for_self(2, 2, "X")
  end

  def test_imminent_win_for_self_diagonal_1_3
    @board.set(3, 1, "X")
    @board.set(2, 2, "X")
    assert_winning_pair_for_self(1, 3, "X")
  end

  def test_imminent_win_for_self_diagonal_3_1
    @board.set(1, 3, "X")
    @board.set(2, 2, "X")
    assert_winning_pair_for_self(3, 1, "X")
  end

  def test_imminent_win_for_self_diagonal_2_2_top_to_bottom
    @board.set(1, 3, "X")
    @board.set(3, 1, "X")
    assert_winning_pair_for_self(2, 2, "X")
  end

  private
  def assert_winning_pair(row, column)
    pair = @win_detector.imminent_win(@board)
    assert_equal row, pair.row
    assert_equal column, pair.column
  end

  def assert_winning_pair_for_self(row, column, symbol)
    pair = @win_detector.imminent_win_for_self(@board, symbol)
    assert_equal row, pair.row
    assert_equal column, pair.column
  end
end
