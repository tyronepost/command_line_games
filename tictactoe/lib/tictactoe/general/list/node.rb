
class Node
  attr_accessor :data
  attr_reader :next

  def next=(node)
    raise StandardError unless node.is_a? Node or node.nil?
    @next = node
  end
end
