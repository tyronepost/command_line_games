require_relative '../interfaces/human_interface_factory'
require_relative '../renderers/renderer_factory'
require_relative 'menu'

class LayoutMenu < Menu
  include MenuSelector

  RENDERER_MAP ||= { 1 => :renderer1, 2 => :renderer2 }
  HUMAN_INTERFACE_MAP ||= { 1 => :interface1, 2 => :interface2 }

  def initialize(io_device)
    @io_device = io_device
  end

  def run_menu
    select_layout
    { renderer: @renderer,
      human_interface: @human_interface }
  end

  private
  def select_layout
    layout_selection_menu
    selection = menu_select([1, 2]) { layout_selection_menu }
    @renderer = RendererFactory.make_renderer(RENDERER_MAP[selection], @io_device)
    @human_interface = HumanInterfaceFactory.make_interface(HUMAN_INTERFACE_MAP[selection])
  end

  def layout_selection_menu
    @io_device.puts ""
    @io_device.puts "   ______ ______ ______         ______ ______ ______ "
    @io_device.puts "  |      |      |      |       |      |      |      |"
    @io_device.puts "A |      |      |      |       |  0   |  1   |  2   |"
    @io_device.puts "  |______|______|______|       |______|______|______|"
    @io_device.puts "  |      |      |      |       |      |      |      |"
    @io_device.puts "B |      |      |      |       |  3   |  4   |  5   |"
    @io_device.puts "  |______|______|______|       |______|______|______|"
    @io_device.puts "  |      |      |      |       |      |      |      |"
    @io_device.puts "C |      |      |      |       |  6   |  7   |  8   |"
    @io_device.puts "  |______|______|______|       |______|______|______|"
    @io_device.puts "      1      2      3                                "
    @io_device.puts ""
    @io_device.puts "  ______________________       ______________________"
    @io_device.puts "             1                            2          "
    @io_device.print "Choose your preferred layout: "
  end
end