require_relative 'test_helper'

class TicTacToeTest < Minitest::Test
  def test_tictactoe_module
    assert TicTacToe::MAP
    main = TicTacToe::main(nil)
    assert main.is_a?(TicTacToe::Main)
  end
end