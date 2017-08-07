require_relative 'menu'
require_relative '../general/list/circular_list'
require_relative '../behaviors/human_behavior'
require_relative '../behaviors/ai_behavior_factory'
require_relative '../general/player'
require_relative 'illegal_state_error'

class PlayerMenu < Menu
  attr_accessor :symbol_menu, :difficulty_menu

  def run_menu
    sub_class_menu
    player_hash
  end

  protected
  attr_reader :io_device, :player_order_menu

  def sub_class_menu
    raise "called abstract method: sub_class_menu"
  end

  def initialize(io_device)
    @io_device = io_device
    @players = CircularList.new
    @used_symbols = []
  end

  def player_hash
    { players: @players }
  end

  def get_human_player(num)
    raise IllegalStateError.new, "symbol_menu must be set" if symbol_menu.nil?
    io_device.print "Enter name for Player #{num}: "
    args = set_player_args(num)
    args[:behavior] = HumanBehavior.new(io_device)
    args[:type] = :human
    Player.new(args)
  end

  def get_computer_player(num)
    raise IllegalStateError.new, "symbol_menu must be set" if symbol_menu.nil?
    raise IllegalStateError.new, "difficulty_menu must be set" if difficulty_menu.nil?
    io_device.print "Enter name for Player #{num} (Computer): "
    args = set_player_args(num)
    args[:name] += " (Computer)"
    args[:behavior] = set_difficulty(args[:name])
    args[:type] = :computer
    Player.new(args)
  end

  def set_player_args(num)
    name = io_device.get_string
    args = Hash.new
    args[:name] = name
    args[:number] = num
    args[:symbol] = symbol_menu.run_menu(name, @used_symbols)
    args
  end

  def set_difficulty(name)
    difficulty = difficulty_menu.run_menu(name)
    AIBehaviorFactory.make_behavior(difficulty)
  end
end
