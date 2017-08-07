require_relative '../../test_helper'

class PlayerOrderMenuTest < Minitest::Test
  def setup
    @io_device = IODeviceSpy.new

    @player_one = Player.new(name: "tyrone", number: "1")
    @player_two = Player.new(name: "sherri", number: "2")
    @players = CircularList.new
    @players.insert(@player_one)
    @players.insert(@player_two)

    @player_order_menu = PlayerOrderMenu.new(@io_device)
  end

  def test_player_order_menu
    @player_order_menu.set_players(@players)
  end
end