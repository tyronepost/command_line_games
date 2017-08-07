class GameLoop
  def set(args)
    @rules = args[:rules]
    @board = args[:board]
    @players = args[:players]
    @renderer = args[:renderer]
    @io_device = args[:io_device]
    @human_interface = args[:human_interface]
  end

  def run
    @renderer.draw(@board)
    until game_over?
      next_turn
    end
    @rules.declare_result(@io_device, @players)
  end

  private
  def game_over?
    @rules.winner? || @rules.tie?
  end

  def next_turn
    player = @players.current.data
    player.play(@human_interface, @board)
    output_last_move(player)
    @players.advance
    @renderer.draw(@board)
  end

  def output_last_move(player)
    last_move = @human_interface.interface_coords(player.last_move)
    @io_device.puts "\n#{player.name} played #{last_move}"
  end
end