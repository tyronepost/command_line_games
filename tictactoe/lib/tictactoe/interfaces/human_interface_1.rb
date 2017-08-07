require_relative '../general/board'

class HumanInterface1
  attr_reader :y_map
  def initialize
    @y_map = { A: 3, B: 2, C: 1 }
    @x_map = { "1" => 1, "2" => 2, "3" => 3 }
    @count = 0
  end

  def set(board, input, value)
    if valid?(input) && !set?(board, input)
      pair = board.set(y_map[input[0].to_sym], @x_map[input[1]], value)
      @count += 1
      pair
    end
  end

  def interface_coords(pair)
    y_axis = @y_map.key(pair.row).to_s
    x_axis = @x_map.key(pair.column).to_s
    "#{y_axis}, #{x_axis}"
  end

  def valid_length?(input)
    input.length == 2
  end

  def valid?(input)
    %w[ A B C ].include?(input[0]) &&
    %w[ 1 2 3 ].include?(input[1])
  end

  def show_valid_input
    "Input must be in the form {row}{column} where \n" +
    "row is A, B or C, and column is 1, 2, or 3.\n" +
    "Examples: A1, b2, C3"
  end

  def set?(board, input)
    value = get(board, input[0], input[1])
    value != board.default && !value.nil?
  end

  def get(board, row, column)
    board.get(y_map[row.to_sym], @x_map[column])
  end
end