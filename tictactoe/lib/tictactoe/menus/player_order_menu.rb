require_relative 'menu'

class PlayerOrderMenu < Menu
  def initialize(io_device)
    @io_device = io_device
  end

  def set_players(players)
    @players = players
  end

  def run_menu
    { first_player: select_first_player }
  end

  private
  attr_reader :players
  def select_first_player
    player_order_menu
    menu_select([1, 2]) { player_order_menu }
  end

  def player_order_menu
    player_1_name = players.current.data.name
    player_2_name = players.next.data.name
    @io_device.puts "1:  Player 1 [#{player_1_name}]"
    @io_device.puts "2:  Player 2 [#{player_2_name}]"
    @io_device.print "Select which player goes first: "
  end
end