require_relative '../../test_helper'

class HumanBehaviorTest < Minitest::Test
  def setup
    @interface = InterfaceSpy.new
    @io_device = IODeviceSpy.new
    @behavior = HumanBehavior.new @io_device
  end

  def test_play_with_valid_input
    @interface.valid = true
    @interface.valid_length = true
    @interface.is_set = false
    @io_device.input = %w(A1)
    @behavior.play(@interface, nil, "X")
    assert @interface.set_called
  end

  def test_play_with_invalid_length
    @interface.valid = true
    @interface.valid_length = false
    @interface.is_set = false
    @io_device.input = %w(A1)
    @behavior.play(@interface, nil, "X")
    assert !@interface.set_called
  end

  def test_play_with_invalid_input
    @interface.valid = false
    @interface.valid_length = true
    @interface.is_set = false
    @io_device.input = %w(A1)
    @behavior.play(@interface, nil, "X")
    assert !@interface.set_called
  end

  def test_play_with_space_already_set
    @interface.valid = true
    @interface.valid_length = true
    @interface.is_set = true
    @io_device.input = %w(A1)
    @behavior.play(@interface, nil, "X")
    assert !@interface.set_called
  end
end
