require_relative '../../test_helper'

class PlayerMenuFactoryTest < Minitest::Test
  def setup
    @player_menu_factory = PlayerMenuFactory.new
  end

  def test_player_menu_factory
    assert @player_menu_factory
    player_menu = @player_menu_factory.create_player_menu(nil, :human_vs_computer)
    assert player_menu.is_a?(HumanVsComputerMenu)

    player_menu = @player_menu_factory.create_player_menu(nil, :human_vs_human)
    assert player_menu.is_a?(HumanVsHumanMenu)

    player_menu = @player_menu_factory.create_player_menu(nil, :computer_vs_computer)
    assert player_menu.is_a?(ComputerVsComputerMenu)
  end
end