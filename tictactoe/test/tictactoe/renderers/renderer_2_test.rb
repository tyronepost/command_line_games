require_relative '../../test_helper'

class Renderer2Test < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
    @io_device = IODeviceSpy.new
    @renderer = Renderer2.new @io_device
  end

  def test_draw
    @renderer.draw @board
    assert_equal empty_board, @io_device.message
  end

  private
  def empty_board
    "\n" +
    "  ______ ______ ______\n" +
    " |      |      |      |\n" +
    " |  0   |  1   |  2   |\n" +
    " |______|______|______|\n" +
    " |      |      |      |\n" +
    " |  3   |  4   |  5   |\n" +
    " |______|______|______|\n" +
    " |      |      |      |\n" +
    " |  6   |  7   |  8   |\n" +
    " |______|______|______|\n" +
    ""
  end
end