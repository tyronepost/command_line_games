
class SymbolMenu
  def initialize(io_device)
    @io_device = io_device
  end

  def run_menu(name, used_symbols)
    select_symbol(name, used_symbols)
  end

  private
  attr_reader :io_device
  def select_symbol(name, used_symbols)
    symbol = get_symbol(name)
    until symbol_valid?(symbol, used_symbols)
      symbol = get_symbol(name)
    end
    used_symbols << symbol
    symbol
  end

  def get_symbol(name)
    io_device.print "Select a game symbol for #{name} (any character on your keyboard): "
    io_device.gets.chomp
  end

  def symbol_valid?(symbol, used_symbols)
    if used_symbols.include?(symbol)
      io_device.puts "'#{symbol}' already taken"
      false
    elsif symbol.size == 0
      io_device.puts "You must enter a single character"
      false
    elsif symbol.size > 1
      io_device.puts "Symbol length must be one character long"
      false
    else
      true
    end
  end
end