require_relative '../lib/tictactoe/main'
require_relative '../../command_line_games/lib/command_line_games/io_device'

main = TicTacToe::Main.new(IODevice.new)
main.run
