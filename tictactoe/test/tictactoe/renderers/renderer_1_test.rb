require_relative '../../test_helper'

class Renderer1Test < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
    @io_device = IODeviceSpy.new
    @renderer = Renderer1.new @io_device
  end

  def test_draw
    @renderer.draw @board
    assert_equal empty_board, @io_device.message
  end

  private
  def empty_board
    "\n" +
    "   ______ ______ ______\n" +
    "  |      |      |      |\n" +
    "A |      |      |      |\n" +
    "  |______|______|______|\n" +
    "  |      |      |      |\n" +
    "B |      |      |      |\n" +
    "  |______|______|______|\n" +
    "  |      |      |      |\n" +
    "C |      |      |      |\n" +
    "  |______|______|______|\n" +
    "     1      2      3"
  end
end