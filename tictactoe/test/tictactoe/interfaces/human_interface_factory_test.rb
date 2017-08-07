require_relative '../../test_helper'

class HumanInterfaceFactoryTest < Minitest::Test
  def setup
    @board = Board.new size: 3, default: " "
  end
  def test_make_interface
    assert HumanInterfaceFactory.make_interface(:interface1).is_a?(HumanInterface1)
    assert HumanInterfaceFactory.make_interface(:interface2).is_a?(HumanInterface2)
  end
end