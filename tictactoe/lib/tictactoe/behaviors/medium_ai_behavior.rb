require_relative '../general/pair'
require_relative 'helpers/win_detector'
require_relative 'helpers/random_space_selector'

class MediumAIBehavior
  attr_reader :win_detector
  def initialize
    @win_detector = WinDetector.new
    @random_space_selector = RandomSpaceSelector.new
  end

  def play(_, board, symbol)
    if pair = win_detector.imminent_win(board)
    elsif !board.set?(2, 2)
      pair = Pair.new(2, 2)
    else
      pair = @random_space_selector.random_space(board)
    end
    board.set pair.row, pair.column, symbol
    pair
  end
end