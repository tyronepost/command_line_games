require_relative '../../test_helper'

class PlayerTest < Minitest::Test
  def setup
    @behavior = BehaviorSpy.new
    @player = Player.new(name: "Tyrone", number: 1, symbol: "X", behavior: @behavior )
  end

  def test_initialize
    assert @player
    assert_equal "Tyrone", @player.name
    assert_equal 1, @player.number
    assert_equal "X", @player.symbol
  end

  def test_play
    @player.play(nil, nil)
    assert @behavior.play_called
  end
end