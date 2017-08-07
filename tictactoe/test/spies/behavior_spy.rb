
class BehaviorSpy
  attr_reader :play_called
  def initialize
    @play_called = false
  end

  def play(interface, board, symbol)
    @play_called = true
  end
end