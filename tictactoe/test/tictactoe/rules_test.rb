require_relative '../test_helper'

class RulesTest < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
    @rules = TicTacToe::Rules.new @board
  end

  def test_initialize
    assert @rules
  end

  def test_regression_1
    @board.set(3, 1, "X")
    @board.set(2, 2, "O")
    @board.set(3, 3, "X")
    @board.set(3, 2, "O")
    assert !@rules.winner?
    assert !@rules.tie?
  end

  def test_declare_result
    board = Board.new(size: 3, default: "X")
    player = Player.new(name: "tyrone", symbol: "X")
    players = CircularList.new
    players.insert(player)
    rules = TicTacToe::Rules.new(board)
    io_device = IODeviceSpy.new
    rules.declare_result(io_device, players)

    assert io_device.messages.include?("\ntyrone wins!!\n")
  end

  def test_winner_row_1
    assert !@rules.winner?
    set_row 1, "O"
    assert @rules.winner?
    assert_equal "O", @rules.winning_symbol
  end

  def test_winner_row_2
    assert !@rules.winner?
    set_row 2, "O"
    assert @rules.winner?
    assert_equal "O", @rules.winning_symbol
  end

  def test_winner_row_3
    assert !@rules.winner?
    set_row 3, "O"
    assert @rules.winner?
    assert_equal "O", @rules.winning_symbol
  end

  def test_winner_column_1
    assert !@rules.winner?
    set_column 1, "X"
    assert @rules.winner?
    assert_equal "X", @rules.winning_symbol
  end

  def test_winner_column_2
    assert !@rules.winner?
    set_column 2, "X"
    assert @rules.winner?
    assert_equal "X", @rules.winning_symbol
  end

  def test_winner_column_3
    assert !@rules.winner?
    set_column 3, "X"
    assert @rules.winner?
    assert_equal "X", @rules.winning_symbol
  end

  def test_tie
    assert !@rules.tie?
    set_tie
    assert @rules.tie?
    assert !@rules.winning_symbol
  end

  private
  def set_row(row, symbol)
    @board.set row, 1, symbol
    @board.set row, 2, symbol
    @board.set row, 3, symbol
  end

  def set_column(column, symbol)
    @board.set column, 1, symbol
    @board.set column, 2, symbol
    @board.set column, 3, symbol
  end

  def set_tie
    @board.set 1, 1, "X"
    @board.set 1, 2, "O"
    @board.set 1, 3, "X"
    @board.set 2, 1, "X"
    @board.set 2, 2, "X"
    @board.set 2, 3, "O"
    @board.set 3, 1, "O"
    @board.set 3, 2, "X"
    @board.set 3, 3, "O"
  end
end
