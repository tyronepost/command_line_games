require_relative 'player_menu'

class ComputerVsComputerMenu < PlayerMenu
  def initialize(io_device)
    super(io_device)
  end

  protected
  def sub_class_menu
    @players.insert get_computer_player(1)
    @players.insert get_computer_player(2)
  end
end