require_relative 'pair'

class Board
  attr_reader :size, :default
  def initialize(args)
    @size = args[:size]
    @default = args[:default]
    @hash = Hash.new { |hash, key| hash[key] = Hash.new(@default) }
  end

  def set(x, y, value)
    unless out_of_bounds? x, y
      @hash[x][y] = value
      Pair.new(x, y)
    end
  end

  def get(x, y)
    @hash[x][y] unless out_of_bounds? x, y
  end

  def set?(x, y)
    value = get(x, y)
    value_set?(value)
  end

  def full?
    (1..size).reduce(true) do |outer_bool, i|
      outer_bool &&= (1..size).reduce(true) do |inner_bool, j|
        inner_bool &&= value_set?(@hash[i][j])
      end
    end
  end

  def empty?
    (1..3).reduce(true) do |outer_bool, row|
      outer_bool &&= (1..3).reduce(true) do |inner_bool, column|
        inner_bool &&= !set?(row, column)
      end
    end
  end

  private
  def out_of_bounds?(x, y)
    x < 1 || x > size || y < 1 || y > size
  end

  def value_set?(val)
    !val.nil? && val != default
  end
end
