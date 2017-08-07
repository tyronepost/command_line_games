
class Player
  attr_reader :name, :number, :symbol, :type

  def initialize(args)
    @name = args[:name]
    @number = args[:number]
    @behavior = args[:behavior]
    @symbol = args[:symbol]
    @interface = args[:interface]
    @type = args[:type]
  end

  def play(interface, board)
    @last_move = @behavior.play interface, board, symbol
  end

  def last_move
    @last_move
  end
end