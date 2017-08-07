
class Pair
  attr_accessor :row, :column

  def initialize(row, column)
    @row = row
    @column = column
  end

  def to_s
    "row: #{row}, column: #{column}"
  end
end