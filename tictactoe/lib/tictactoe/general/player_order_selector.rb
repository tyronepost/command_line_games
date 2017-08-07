class PlayerOrderSelector
  def initialize(players)
    @players = players
  end

  def set_first(first_player)
    count = 0
    until @players.current.data.number == first_player
      @players.advance
      count += 1
      raise "#{first_player} not available" if count > @players.size
    end
  end
end