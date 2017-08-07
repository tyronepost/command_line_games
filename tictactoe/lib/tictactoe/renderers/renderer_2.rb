
class Renderer2
  attr_reader :board

  def initialize(output_device)
    @output_device = output_device
  end

  def draw(board)
    zero = board.set?(3, 1)? board.get(3, 1) : "0"
    one = board.set?(3, 2)? board.get(3, 2) : "1"
    two = board.set?(3, 3)? board.get(3, 3) : "2"
    three = board.set?(2, 1)? board.get(2, 1) : "3"
    four = board.set?(2, 2)? board.get(2, 2) : "4"
    five = board.set?(2, 3)? board.get(2, 3) : "5"
    six = board.set?(1, 1)? board.get(1, 1) : "6"
    seven = board.set?(1, 2)? board.get(1, 2) : "7"
    eight = board.set?(1, 3)? board.get(1, 3) : "8"
    screen =
        %{
  ______ ______ ______
 |      |      |      |
 |  #{zero}   |  #{one}   |  #{two}   |
 |______|______|______|
 |      |      |      |
 |  #{three}   |  #{four}   |  #{five}   |
 |______|______|______|
 |      |      |      |
 |  #{six}   |  #{seven}   |  #{eight}   |
 |______|______|______|
}
   @output_device.puts screen
  end
end