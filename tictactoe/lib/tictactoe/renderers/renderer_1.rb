
class Renderer1
  def initialize(output_device)
    @output_device = output_device
  end
  def draw(board)
    screen =
%{
   ______ ______ ______
  |      |      |      |
A |  #{board.get(3, 1)}   |  #{board.get(3, 2)}   |  #{board.get(3, 3)}   |
  |______|______|______|
  |      |      |      |
B |  #{board.get(2, 1)}   |  #{board.get(2, 2)}   |  #{board.get(2, 3)}   |
  |______|______|______|
  |      |      |      |
C |  #{board.get(1, 1)}   |  #{board.get(1, 2)}   |  #{board.get(1, 3)}   |
  |______|______|______|
     1      2      3}
    @output_device.puts screen
  end
end
