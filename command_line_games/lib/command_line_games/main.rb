require 'chess'
require 'tictactoe'
require_relative 'io_device'
require_relative 'cl_games_menu'

module CommandLineGames
  class Main
    def initialize
      @io_device = IODevice.new
      @game_menu_map = {
          1 => Chess::MAP,
          2 => TicTacToe::MAP,
          3 => {symbol: :exit, name: "Exit the program." }
      }
    end

    def run
      loop do
        selection = CLGamesMenu.new(@io_device, @game_menu_map).run_menu
        break if selection == :exit
        game = setup_game(selection)
        game.run
      end
    end

    private
    def setup_game(selection)
      case selection
        when Chess::MAP[:symbol] then Chess::main(@io_device)
        when TicTacToe::MAP[:symbol] then TicTacToe::main(@io_device)
      end
    end
  end
end
