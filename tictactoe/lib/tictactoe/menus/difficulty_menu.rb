require_relative 'menu'

class DifficultyMenu < Menu
  DIFFICULTY_MAP ||= {1 => :easy, 2 => :medium, 3 => :hard}

  def initialize(io_device)
    @io_device = io_device
  end

  def run_menu(name)
    difficulty_setting_menu(name)
    selection = menu_select([1, 2, 3]) { difficulty_setting_menu(name) }
    DIFFICULTY_MAP[selection]
  end

  private
  attr_reader :io_device
  def difficulty_setting_menu(name)
    io_device.puts hr
    io_device.puts "1: Easy"
    io_device.puts "2: Medium"
    io_device.puts "3: Hard"
    io_device.print "Select a difficulty setting for #{name}: "
  end
end