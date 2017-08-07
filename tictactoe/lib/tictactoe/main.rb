require_relative 'menus/main_menu'
require_relative 'general/board'
require_relative 'menus/layout_menu'
require_relative 'menus/game_mode_menu'
require_relative 'menus/player_menu_factory'
require_relative 'menus/player_order_menu'
require_relative 'menus/symbol_menu'
require_relative 'menus/difficulty_menu'
require_relative 'general/player_order_selector'
require_relative 'general/game'
require_relative 'general/game_loop'
require_relative 'rules'

module TicTacToe
  class Main
    attr_reader :game_loop, :game_settings

    def initialize(io_device)
      @io_device = io_device
      @game_loop = GameLoop.new
      @game_settings = {io_device: @io_device}
    end


    def run
      run_menu
      raise "Must run menu first" unless menu_ran?
      Game.new(self, @io_device).run
    end

    def run_menu
      @game_settings.merge! main_menu.run_menu
      @menu_ran = true
    end

    def new_game
      raise "Must run menu first" unless menu_ran?
      player_order_selector = PlayerOrderSelector.new(game_settings[:players])
      player_order_selector.set_first(game_settings[:first_player])
      game_settings.merge! initialize_board
    end

    private
    def main_menu
      MainMenu.new(
          io_device: @io_device,
          layout_menu: LayoutMenu.new(@io_device),
          game_mode_menu: GameModeMenu.new(@io_device),
          player_menu_factory: PlayerMenuFactory.new,
          player_order_menu: PlayerOrderMenu.new(@io_device),
          symbol_menu: SymbolMenu.new(@io_device),
          difficulty_menu: DifficultyMenu.new(@io_device))
    end

    def initialize_board
      board = new_board
      {board: board,
       rules: Rules.new(board)}
    end

    def new_board
      Board.new size: 3, default: " "
    end

    def menu_ran?
      @menu_ran
    end
  end
end
