module Chess
  MAP = { symbol: :chess, name: "Chess (Incomplete)" }
  def Chess.main(io_device)
    Main.new(io_device)
  end

  class Main
    def initialize(io_device)
      @io_device = io_device
    end
    def run
      io_device.puts ""
      io_device.puts "Sorry!! Chess is not yet implemented."
      io_device.puts " :-( "
      io_device.puts " :-( "
      io_device.puts " :-( "
      io_device.puts " :-( "
      io_device.puts " :-( "
      io_device.puts ""
    end
    private
    attr_reader :io_device
  end
end