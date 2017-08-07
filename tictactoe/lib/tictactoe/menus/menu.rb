require_relative 'menu_selector'

class Menu
  include MenuSelector

  protected
  def hr
    "-------------------------------------------------------"
  end
end