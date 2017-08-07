class Game
  def initialize(main, io_device)
    @main = main
    @io_device = io_device
  end

  def run
    loop do
      main.new_game
      game_loop.set(game_settings)
      game_loop.run
      break unless play_again?
    end
  end

  private
  attr_reader :main, :io_device

  def game_loop
    main.game_loop
  end

  def game_settings
    main.game_settings
  end

  def play_again?
    loop do
      io_device.print "Would you like to play again? (Y = yes / anything else = no) "
      input = io_device.gets.strip.upcase
      if input == "Y"
        return true
      elsif input == "N"
        return false
      else
        io_device.puts "#{input} is not a valid selection."
      end
    end
  end
end
