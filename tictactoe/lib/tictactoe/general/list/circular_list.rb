require_relative 'node'

class CircularList
  attr_reader :current, :size
  def initialize
    @size = 0
  end
  
  def insert(data)
    if current.nil?
      add_first data
    else
      add_last data
    end
    @size += 1
  end

  def find
    (1..size).each do
      data = current.data
      return data if yield(data)
      advance 
    end
  end

  def next
    current.next
  end

  def advance
    @current = current.next
  end

  private
  def add_first(data)
    @first = Node.new
    @first.data = data;
    @first.next = @first
    @last = @first
    @current = @first
  end

  def add_last(data)
    node = Node.new
    node.data = data
    node.next = @first
    @last.next = node
    @last = node
  end
end
