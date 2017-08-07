require_relative '../../test_helper'

class GameTest < Minitest::Test
  def setup
    @game_settings = {}
    @io_device = IODeviceSpy.new
    @main_stub = MainStub.new
    @game = Game.new(@main_stub, @io_device)
  end

  def test_game
    assert @game
    @io_device.input = %w(y y n)
    @game.run

    assert_equal 3, @main_stub.game_loop.count
  end

end

class MainStub
  def initialize
    @game_loop = GameLoopStub.new
  end

  def game_settings
  end

  def game_loop
    @game_loop
  end

  def new_game
  end
end

class GameLoopStub
  attr_reader :count
  def initialize
    @count = 0
  end
  def set(game_settings)
  end

  def run
    @count += 1
  end
end