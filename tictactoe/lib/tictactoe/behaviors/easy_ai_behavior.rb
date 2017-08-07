require_relative '../general/pair'
require_relative 'helpers/random_space_selector'

class EasyAIBehavior
  def initialize
    @random_space_selector = RandomSpaceSelector.new
  end

  def play(_, board, symbol)
    pair = @random_space_selector.random_space(board)
    board.set pair.row, pair.column, symbol
    pair
  end
end