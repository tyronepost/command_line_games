require_relative 'player_menu'

class HumanVsHumanMenu < PlayerMenu
  def initialize(io_device)
    super(io_device)
  end

  protected
  def sub_class_menu
    @players.insert get_human_player(1)
    @players.insert get_human_player(2)
  end
end