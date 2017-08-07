require_relative '../../general/pair'

class RandomSpaceSelector
  def random_space(board)
    available_spaces = []
    (1..3).each do |i|
      (1..3).each do |j|
        available_spaces << Pair.new(i, j) if !board.set?(i, j)
      end
    end
    n = rand(0..available_spaces.size - 1)
    available_spaces[n]
  end
end