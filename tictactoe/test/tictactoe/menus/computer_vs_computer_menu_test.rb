require_relative '../../test_helper'

class ComputerVsComputerMenuTest < Minitest::Test
  def setup
    @difficulty_menu = DifficultyMenuStub.new
    @symbol_menu = SymbolMenuStub.new
    @io_device = IODeviceSpy.new
    @io_device.input = %w(tyrone x bob o 1)
    @computer_vs_computer_menu = ComputerVsComputerMenu.new(@io_device)
  end

  def test_computer_vs_computer_menu
    @computer_vs_computer_menu.symbol_menu = @symbol_menu
    @computer_vs_computer_menu.difficulty_menu = @difficulty_menu

    player_hash = @computer_vs_computer_menu.run_menu

    players = player_hash[:players]
    assert_equal 2, players.size

    player_1 = players.current.data
    assert_equal :computer, player_1.type

    players.advance
    player_2 = players.current.data
    assert_equal :computer, player_2.type
  end

  def test_raise_error_when_difficulty_menu_not_set
    @computer_vs_computer_menu.symbol_menu = @symbol_menu
    assert_raises IllegalStateError do
      @computer_vs_computer_menu.run_menu
    end
  end

  def test_raise_error_when_symbol_menu_not_set
    @computer_vs_computer_menu.difficulty_menu = @difficulty_menu
    assert_raises IllegalStateError do
      @computer_vs_computer_menu.run_menu
    end
  end
end