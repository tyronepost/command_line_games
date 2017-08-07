class PlayerMenuFactorySpy
  attr_reader :create_player_menu_called

  def create_player_menu(io_device, type)
    @create_player_menu_called = true
    Object.new
  end
end