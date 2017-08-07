
class HumanBehavior
  def initialize(io_device)
    @io_device = io_device
  end

  def play(interface, board, symbol)
    until input_valid?(interface, board, input = @io_device.get_string) or input.nil?
      @io_device.puts @error_message
    end
    interface.set(board, input, symbol) unless input.nil?
  end

  private
  def input_valid?(interface, board, input)
    if !interface.valid_length? input
      @error_message = "Invalid length: \n#{interface.show_valid_input}"
      false
    elsif !interface.valid? input
      @error_message = "Invalid input: \n#{interface.show_valid_input}"
      false
    elsif interface.set? board, input
      @error_message = "The space corresponding to \"#{input}\" is already taken."
      false
    else
      true
    end
  end
end