require_relative 'tictactoe/main'

module TicTacToe
  MAP ||= { symbol: :tictactoe, name: "Tic Tac Toe" }

  def TicTacToe.main(io_device)
    TicTacToe::Main.new(io_device)
  end
end