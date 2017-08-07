require_relative '../test_helper'

class MainTest < Minitest::Test
  def setup
    @io_device = IODeviceSpy.new
  end

  def test_new_game
    @main = main
    @main.run_menu
    @main.new_game
  end

  private
  def main
    @io_device.input = %w[ 1 1 tyrone x bob o 1 2 n]
    TicTacToe::Main.new @io_device
  end
end