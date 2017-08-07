require_relative '../../test_helper'

class SymbolMenuTest < Minitest::Test
  def setup
    @io_device = IODeviceSpy.new
    @symbol_menu = SymbolMenu.new(@io_device)
    @used_symbols = []
  end

  def test_symbol_menu
    assert @symbol_menu
    @io_device.input = %w(x)
    symbol = @symbol_menu.run_menu("tyrone", @used_symbols)
    assert_equal "x", symbol
    assert @used_symbols.include? "x"

    @io_device.input = %w(x o)
    symbol = @symbol_menu.run_menu("tyrone", @used_symbols)
    assert_equal "o", symbol
  end

  def test_input_not_blank
    @io_device.input = ["", "x"]
    symbol = @symbol_menu.run_menu("tyrone", @used_symbols)
    assert @io_device.messages.include?("You must enter a single character")
    assert_equal "x", symbol
  end

  def test_input_only_one_character
    @io_device.input = %w(blah x)
    symbol = @symbol_menu.run_menu("tyrone", @used_symbols)
    assert @io_device.messages.include?("Symbol length must be one character long")
    assert_equal "x", symbol
  end
end