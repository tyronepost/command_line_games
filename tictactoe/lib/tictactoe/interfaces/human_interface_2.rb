
class HumanInterface2
  def initialize
    @key_map = { "0" => {row: 3, column: 1},
                 "1" => {row: 3, column: 2},
                 "2" => {row: 3, column: 3},
                 "3" => {row: 2, column: 1},
                 "4" => {row: 2, column: 2},
                 "5" => {row: 2, column: 3},
                 "6" => {row: 1, column: 1},
                 "7" => {row: 1, column: 2},
                 "8" => {row: 1, column: 3}  }
  end

  def set(board, key, value)
    h = @key_map[key]
    board.set h[:row], h[:column], value
  end

  def get(board, key)
    h = @key_map[key]
    board.get h[:row], h[:column]
  end

  def set?(board, key)
    h = @key_map[key]
    value = board.get h[:row], h[:column]
    !value.nil? && value != board.default
  end

  def interface_coords(pair)
    "#{@key_map.key({row: pair.row, column: pair.column})}"
  end

  def valid_length?(input)
    input.length == 1
  end

  def valid?(key)
    %w[0 1 2 3 4 5 6 7 8].include? key
  end

  def show_valid_input
    "Input must be in the form {number} where \n" +
    "number is #{(0..8)}." +
    "Examples: 1, 2, 8"
  end
end