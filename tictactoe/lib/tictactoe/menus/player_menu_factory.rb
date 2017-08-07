require_relative 'human_vs_computer_menu'
require_relative 'human_vs_human_menu'
require_relative 'computer_vs_computer_menu'

class PlayerMenuFactory
  def create_player_menu(io_device, type)
    case type
      when :human_vs_computer     then HumanVsComputerMenu.new(io_device)
      when :human_vs_human        then HumanVsHumanMenu.new(io_device)
      when :computer_vs_computer  then ComputerVsComputerMenu.new(io_device)
    end
  end
end