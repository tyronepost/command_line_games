require_relative 'menu'

class MainMenu < Menu

  def initialize(args)
    @io_device = args[:io_device]
    @layout_menu = args[:layout_menu]
    @game_mode_menu = args[:game_mode_menu]
    @player_menu_factory = args[:player_menu_factory]
    @player_order_menu = args[:player_order_menu]
    @symbol_menu = args[:symbol_menu]
    @difficulty_menu = args[:difficulty_menu]
    @game_settings = Hash.new
  end

  def run_menu
    io_device.puts "Welcome to Tic Tac Toe!"
    io_device.puts hr
    @game_settings.merge! layout_menu.run_menu
    type = game_mode_menu.run_menu
    player_hash = player_menu(type).run_menu
    player_order_menu.set_players(player_hash[:players])
    @game_settings.merge! player_order_menu.run_menu
    @game_settings.merge! player_hash
    @game_settings
  end

  private

  attr_reader :io_device,
              :layout_menu,
              :game_mode_menu,
              :player_menu_factory,
              :player_order_menu,
              :symbol_menu,
              :difficulty_menu

  def player_menu(type)
    player_menu = player_menu_factory.create_player_menu(io_device, type)
    player_menu.symbol_menu = symbol_menu
    player_menu.difficulty_menu = difficulty_menu
    player_menu
  end
end