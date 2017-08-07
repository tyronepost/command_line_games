require_relative '../../test_helper'

class GameLoopTest < Minitest::Test
  def setup
    board = Board.new size: 3, default: " "
    rules = TicTacToe::Rules.new board
    behavior = AIBehaviorFactory.make_behavior :hard
    players = CircularList.new
    players.insert Player.new(name: "Computer 1", number: 1, behavior: behavior, symbol: "X")
    players.insert Player.new(name: "Computer 2", number: 2, behavior: behavior, symbol: "O")
    args = {board: board,
            rules: rules,
            players: players,
            renderer: RendererStub.new,
            io_device: IODeviceSpy.new,
            human_interface: HumanInterface1.new,
            first_player: 1}
    @game = GameLoop.new
    @game.set args
  end

  def test_run
    @game.run
  end
end