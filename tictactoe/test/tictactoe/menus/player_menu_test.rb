require_relative '../../test_helper'

class PlayerMenuTest < Minitest::Test

  def test_raise_error_when_run_menu_called_on_super_class
    @player_menu = PlayerMenu.new(nil)
    assert_raises do
      @player_menu.run_menu
    end
  end
end