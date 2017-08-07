module TicTacToe
  class Rules
    attr_reader :move_count, :winning_symbol
    def initialize(board)
      @board = board
      @move_count = 0
    end

    def winner?
      match?
    end

    def tie?
      board.full? && !match?
    end

    def declare_result(io_device, players)
      if winner?
        winner = players.find {|player| player.symbol == winning_symbol}
        io_device.puts "\n#{winner.name} wins!!\n"
      else
        io_device.puts "\nIt's a tie!\n"
      end
    end

    private
    attr_reader :board

    def match?
      (1..3).reduce(false) { |bool, row|  bool ||= matching_row? row } ||
          (1..3).reduce(false) { |bool, column| bool ||= matching_column? column } ||
          matching_diagonal?(1, 3) || matching_diagonal?(3, 1)
    end

    def matching_row?(row)
      first = board.get(row, 1)
      center = board.get(row, 2)
      last = board.get(row, 3)
      matching_vector(first, center, last)
    end

    def matching_column?(column)
      first = board.get(1, column)
      center = board.get(2, column)
      last = board.get(3, column)
      matching_vector(first, center, last)
    end

    def matching_diagonal?(start, finish)
      first = board.get(start, 1)
      center = board.get(2, 2)
      last = board.get(finish, 3)
      matching_vector(first, center, last)
    end

    def matching_vector(first, center, last)
      if center != " " && (first == center) && (center == last)
        @winning_symbol = center
        true
      else
        false
      end
    end
  end
end
