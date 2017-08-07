require_relative '../../test_helper'

class HardAIBehaviorTest < Minitest::Test

  def setup
    @default = " "
    @board = Board.new size: 3, default: @default
    @behavior = HardAIBehavior.new
  end

  def test_empty_board
    assert @board.empty?
    @behavior.play nil, @board, "X"
    assert !@board.empty?
    assert corner_played?
  end

  def test_play_center
    @board.set(1, 1, "O")
    assert !@board.set?(2, 2)
    @behavior.play nil, @board, "X"
    assert @board.set?(2, 2)
  end

  def test_play_corner_when_center_played
    @board.set(2, 2, "O")
    assert !corner_played?
    @behavior.play nil, @board, "X"
    assert corner_played?
  end

  def test_when_caddy_cornered_play_edge
    @board.set(1, 1, "O")
    @board.set(2, 2, "X")
    @board.set(3, 3, "O")
    assert !edge_played?
    @behavior.play nil, @board, "X"
    assert edge_played?
  end

  def test_when_edge_played_play_corner
    @board.set(1, 1, "O")
    @board.set(2, 2, "X")
    @board.set(2, 3, "O")
    @behavior.play nil, @board, "X"
    assert @board.set?(3, 3) || @board.set?(1, 3)
  end

  def test_when_edge_played_play_corner_2
    @board.set(3, 1, "O")
    @board.set(2, 2, "X")
    @board.set(1, 2, "O")
    @behavior.play nil, @board, "X"
    assert @board.set?(1, 1) || @board.set?(1, 3)
  end

  def test_when_edge_played_play_corner_3
    @board.set(1, 1, "O")
    @board.set(2, 2, "X")
    @board.set(3, 2, "O")
    @behavior.play nil, @board, "X"
    assert @board.set?(3, 1) || @board.set?(3, 3)
  end

  def test_when_edge_played_play_corner_4
    @board.set(1, 3, "O")
    @board.set(2, 2, "X")
    @board.set(2, 1, "O")
    @behavior.play nil, @board, "X"
    assert @board.set?(1, 1) || @board.set?(3, 1)
  end

  def test_regression_1
    @board.set(3, 1, "o")
    @board.set(2, 2, "x")
    @board.set(2, 3, "o")
    @board.set(1, 2, "x")
    @board.set(3, 2, "o")
    @board.set(3, 3, "x")
    @board.set(1, 1, "o")
    @board.set(2, 1, "x")
    @behavior.play nil, @board, "o"
    assert @board.set?(1, 3)
  end

  private
  def corner_played?
    @board.set?(1, 1) ||
    @board.set?(3, 1) ||
    @board.set?(1, 3) ||
    @board.set?(3, 3)
  end

  def edge_played?
    @board.set?(1, 2) ||
    @board.set?(2, 1) ||
    @board.set?(2, 3) ||
    @board.set?(3, 2)
  end
end