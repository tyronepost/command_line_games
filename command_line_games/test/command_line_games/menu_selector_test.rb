require_relative '../test_helper'

class MenuSelectorTest < Minitest::Test

  def test_menu_selector
    @io_device = IODeviceSpy.new
    @io_device.input = %w[3 2]
    @menu_selectable = MenuSelectable.new(@io_device)
    @menu_selectable.run

    assert @io_device.messages.include?("Invalid input.")
    assert_equal 2, @menu_selectable.input
  end

  class MenuSelectable
    include MenuSelector
    attr_reader :input
    def initialize(io_device)
      @io_device = io_device
    end

    def run
      @input = menu_select([1, 2]) { }
    end
  end
end