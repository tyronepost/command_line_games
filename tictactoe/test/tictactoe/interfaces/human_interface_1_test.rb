require_relative '../../test_helper'

class HumanInterface1Test < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
    @human_interface = HumanInterface1.new
    @rules = TicTacToe::Rules.new @board
  end

  def test_get_set
    @human_interface.set @board, "A1", "X"
    assert @human_interface.set? @board, "A1"
    assert_equal "X", @human_interface.get(@board, "A", "1")

    assert !@human_interface.set?(@board, "B1")
  end

  def test_full
    assert !@board.full?

    @human_interface.set @board, "A1", "X"
    @human_interface.set @board, "A2", "O"
    @human_interface.set @board, "A3", "X"
    @human_interface.set @board, "B1", "O"
    @human_interface.set @board, "B2", "X"
    @human_interface.set @board, "B3", "O"
    @human_interface.set @board, "C1", "X"
    @human_interface.set @board, "C2", "O"
    @human_interface.set @board, "C3", "X"

    assert @board.full?
  end

  def test_winning_row_A
    assert !@rules.winner?

    @human_interface.set @board, "B1", "X"
    @human_interface.set @board, "B2", "X"
    set_winning_row "A", "O"

    assert @rules.winner?
    assert_equal "O", @rules.winning_symbol
  end

  def test_winning_row_B
    @human_interface.set @board, "A1", "O"
    @human_interface.set @board, "A2", "O"
    set_winning_row "B", "X"
    assert @rules.winner?
  end

  def test_winning_row_C
    @human_interface.set @board, "A1", "O"
    @human_interface.set @board, "A2", "O"
    set_winning_row "C", "X"
    assert @rules.winner?
    assert_equal "X", @rules.winning_symbol
  end

  def test_winning_column_1
    @human_interface.set @board, "A2", "O"
    @human_interface.set @board, "B2", "O"
    set_winning_column "1", "X"
    assert @rules.winner?
  end

  def test_wining_column_2
    @human_interface.set @board, "A1", "O"
    @human_interface.set @board, "B1", "O"
    set_winning_column "2", "X"
    assert @rules.winner?
  end

  def test_winning_column_3
    @human_interface.set @board, "A1", "O"
    @human_interface.set @board, "B1", "O"
    set_winning_column "3", "X"
    assert @rules.winner?
  end

  def test_winning_diagonal_1
    @human_interface.set @board, "A2", "O"
    @human_interface.set @board, "C2", "O"

    @human_interface.set @board, "A1", "X"
    @human_interface.set @board, "B2", "X"
    @human_interface.set @board, "C3", "X"
    assert @rules.winner?
  end

  def test_winning_diagonal_2
    @human_interface.set @board, "A2", "O"
    @human_interface.set @board, "C2", "O"

    @human_interface.set @board, "C1", "X"
    @human_interface.set @board, "B2", "X"
    @human_interface.set @board, "A3", "X"
    assert @rules.winner?
  end

  def test_valid_length
    assert @human_interface.valid_length?("A1")
  end

  private
  def set_winning_row(row, symbol)
    @human_interface.set @board, "#{row}1", symbol
    @human_interface.set @board, "#{row}2", symbol
    @human_interface.set @board, "#{row}3", symbol
  end

  def set_winning_column(column, symbol)
    @human_interface.set @board, "A#{column}", symbol
    @human_interface.set @board, "B#{column}", symbol
    @human_interface.set @board, "C#{column}", symbol
  end
end
