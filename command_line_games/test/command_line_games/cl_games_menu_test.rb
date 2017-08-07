require_relative '../test_helper'

class CLGamesMenuTest < Minitest::Test
  def setup
    @io_device = IODeviceSpy.new
    @map = {
        1 => { symbol: :tictactoe, name: "Tic Tac Toe" },
        2 => { symbol: :chess, name: "Chess" },
        3 => { symbol: :checkers, name: "Checkers" },
        4 => { symbol: :poker, name: "Poker" }
    }
    @cl_games_menu = CLGamesMenu.new(@io_device, @map)
  end

  def test_run_menu
    @io_device.input = ["1"]
    expected =
        "Welcome to Command Line Games!!!\n" +
        "----------------------------------\n" +
        "1: Tic Tac Toe\n" +
        "2: Chess\n" +
        "3: Checkers\n" +
        "4: Poker\n" +
        "\n" +
        "Please select which game you'd like to play: "

    game_selection = @cl_games_menu.run_menu
    assert_equal expected, @io_device.message
    assert_equal :tictactoe, game_selection
  end
end