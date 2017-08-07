require_relative '../../test_helper'

class MainMenuTest < Minitest::Test
  def setup
    @io_device = IODeviceSpy.new
    @main_menu = MainMenu.new({})
  end

  def test_main_menu
    assert @main_menu
  end
end