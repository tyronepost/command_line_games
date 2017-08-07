
class InterfaceSpy
  attr_accessor :valid_length, :valid, :is_set
  attr_reader :set_called

  def set(board, input, symbol)
    @set_called = true
  end

  def valid_length?(input)
    valid_length
  end

  def valid?(input)
   @valid
  end

  def set?(board, input)
    is_set
  end

  def show_valid_input
  end
end