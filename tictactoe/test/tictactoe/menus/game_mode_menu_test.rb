require_relative '../../test_helper'

class GameModeMenuTest < Minitest::Test

  def setup
    @io_device = IODeviceSpy.new
    @game_mode_menu = GameModeMenu.new(@io_device)
  end

  def test_game_mode_menu
    @io_device.input = %w(1)
    assert @game_mode_menu
    type = @game_mode_menu.run_menu
    assert_equal :human_vs_computer, type
  end
end