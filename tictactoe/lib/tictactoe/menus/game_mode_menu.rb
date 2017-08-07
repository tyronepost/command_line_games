require_relative 'menu'

class GameModeMenu < Menu
  PLAYER_MENU_TYPE_MAP ||= {
      1 => :human_vs_computer,
      2 => :human_vs_human,
      3 => :computer_vs_computer
  }

  def initialize(io_device)
    @io_device = io_device
  end

  def run_menu
    select_game_mode
  end

  private
  def select_game_mode
    game_mode_selection_menu
    selection = menu_select([1, 2, 3]) { game_mode_selection_menu }
    PLAYER_MENU_TYPE_MAP[selection]
  end

  def game_mode_selection_menu
    @io_device.puts hr
    @io_device.puts "1: human vs computer"
    @io_device.puts "2: human vs human"
    @io_device.puts "3: computer vs computer"
    @io_device.print "Please choose a game mode: "
  end

end