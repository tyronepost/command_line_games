require_relative '../../test_helper'

class DifficultyMenuTest < Minitest::Test

  def setup
    @io_device = IODeviceSpy.new
    @difficulty_menu = DifficultyMenu.new(@io_device)
  end

  def test_difficulty_menu_easy
    @io_device.input = %w(1)
    difficulty = @difficulty_menu.run_menu("tyrone")
    assert_equal :easy, difficulty
  end

  def test_difficulty_menu_medium
    @io_device.input = %w(2)
    difficulty = @difficulty_menu.run_menu("tyrone")
    assert_equal :medium, difficulty
  end

  def test_difficulty_menu_hard
    @io_device.input = %w(3)
    difficulty = @difficulty_menu.run_menu("tyrone")
    assert_equal :hard, difficulty
  end
end