require_relative '../../test_helper'

class HumanVsHumanMenuTest < Minitest::Test
  def setup
    @difficulty_menu = DifficultyMenuStub.new
    @symbol_menu = SymbolMenuStub.new
    @io_device = IODeviceSpy.new
    @io_device.input = %w(tyrone x bob o 1)
    @human_vs_human_menu = HumanVsHumanMenu.new(@io_device)
  end

  def test_human_vs_human_menu
    @human_vs_human_menu.symbol_menu = @symbol_menu
    @human_vs_human_menu.difficulty_menu = @difficulty_menu

    player_hash = @human_vs_human_menu.run_menu

    players = player_hash[:players]
    assert_equal 2, players.size

    player_1 = players.current.data
    assert_equal :human, player_1.type

    players.advance
    player_2 = players.current.data
    assert_equal :human, player_2.type
  end

  def test_raise_error_when_symbol_menu_not_set
    @human_vs_human_menu.difficulty_menu = @difficulty_menu
    assert_raises IllegalStateError do
      @human_vs_human_menu.run_menu
    end
  end
end