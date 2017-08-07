require_relative '../general/pair'
require_relative 'helpers/win_detector'
require_relative 'helpers/random_space_selector'

class HardAIBehavior
  def initialize
    @win_detector = WinDetector.new
    @random_space_selector = RandomSpaceSelector.new
  end

  def play(_, board, symbol)
    if board.empty?
      pair = play_random_corner board
    elsif pair = @win_detector.imminent_win_for_self(board, symbol)
    elsif pair = @win_detector.imminent_win(board)
    elsif !board.set?(2, 2)
      pair = Pair.new(2, 2)
    elsif no_corners_played? board
      pair = play_random_corner board
    elsif caddy_cornered? board, symbol
      pair = play_random_edge board
    elsif edge_played? board, symbol
      played_edge = get_played_edge(board, symbol)
      pair = play_adjacent_corner(board, played_edge.row, played_edge.column)
    else
      pair = @random_space_selector.random_space board
    end
    board.set pair.row, pair.column, symbol
    pair
  end

  private
  def no_corners_played?(board)
    !board.set?(1, 1) &&
    !board.set?(1, 3) &&
    !board.set?(3, 1) &&
    !board.set?(3, 3)
  end

  def caddy_cornered?(board, symbol)
    (board.set?(1, 1) && board.set?(3, 3) && board.get(1, 1) == board.get(3, 3) && board.get(1, 1) != symbol) ||
    (board.set?(3, 1) && board.set?(1, 3) && board.get(3, 1) == board.get(1, 3) && board.get(3, 1) != symbol)
  end

  def edge_played?(board, symbol)
    board.set?(1, 2) && board.get(1, 2) != symbol ||
    board.set?(2, 1) && board.get(2, 1) != symbol ||
    board.set?(3, 2) && board.get(3, 2) != symbol ||
    board.set?(2, 3) && board.get(2, 3) != symbol
  end

  def get_played_edge(board, symbol)
    if board.set?(1, 2) && board.get(1, 2) != symbol
      Pair.new(1, 2)
    elsif board.set?(2, 1) && board.get(2, 1) != symbol
      Pair.new(2, 1)
    elsif board.set?(3, 2) && board.get(3, 2) != symbol
      Pair.new(3, 2)
    elsif board.set?(2, 3) && board.get(2, 3) != symbol
      Pair.new(2, 3)
    end
  end

  def play_adjacent_corner(board, row, column)
    if row == 1
      pairs = [ Pair.new(1, 1), Pair.new(1, 3) ]
    elsif row == 3
      pairs = [ Pair.new(3, 1), Pair.new(3, 3) ]
    elsif column == 1
      pairs = [ Pair.new(1, 1), Pair.new(3, 1) ]
    elsif column == 3
      pairs = [ Pair.new(1, 3), Pair.new(3, 3) ]
    end
    play_random_pair board, pairs
  end

  def play_random_corner(board)
    pairs = [
        Pair.new(1, 1),
        Pair.new(1, 3),
        Pair.new(3, 1),
        Pair.new(3, 3)
    ]
    play_random_pair board, pairs
  end

  def play_random_edge(board)
    pairs = [
        Pair.new(1, 2),
        Pair.new(2, 1),
        Pair.new(2, 3),
        Pair.new(3, 2)
    ]
    play_random_pair board, pairs
  end

  def play_random_pair(board, pairs)
    available_pairs = []
    pairs.each do |pair|
      available_pairs << pair if !board.set?(pair.row, pair.column)
    end
    if available_pairs.empty?
      @random_space_selector.random_space(board)
    else
      n = rand(0..available_pairs.size - 1)
      available_pairs[n]
    end
  end
end