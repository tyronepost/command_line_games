require_relative "menu_selector"

class CLGamesMenu
  include MenuSelector

  def initialize(io_device, map)
    @io_device = io_device
    @map = map
  end

  def run_menu
    @io_device.print menu
    selection = menu_select(@map.keys) { @io_device.print menu }
    @map[selection][:symbol]
  end

  private
  def menu
    if @menu.nil?
      @menu = "Welcome to Command Line Games!!!\n" +
              "----------------------------------\n"
      @map.each do |key, val|
        @menu += "#{key}: #{val[:name]}\n"
      end
      @menu += "\n"
      @menu += "Please select which game you'd like to play: "
    end
  end
end