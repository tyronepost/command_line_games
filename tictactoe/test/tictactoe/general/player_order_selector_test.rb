require_relative '../../test_helper'

class PlayerOrderSelectorTest < Minitest::Test
  def setup
    @player_one = Player.new(name: "tyrone", number: 1)
    @player_two = Player.new(name: "sherri", number: 2)
    @players = CircularList.new
    @players.insert(@player_one)
    @players.insert(@player_two)

    @player_order_selector = PlayerOrderSelector.new(@players)
  end

  def test_player_order_selector
    assert @player_order_selector
    @player_order_selector.set_first(1)
    assert_equal @player_one, @players.current.data

    @player_order_selector.set_first(2)
    assert_equal @player_two, @players.current.data
  end
end