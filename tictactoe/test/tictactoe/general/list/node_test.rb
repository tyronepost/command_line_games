require_relative '../../../test_helper'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new
  end

  def test_constructor
    assert @node
    assert !@node.data
    assert !@node.next
  end

  def test_data
    @node.data = 1
    assert_equal 1, @node.data
  end

  def test_next
    next_node = Node.new
    @node.next = next_node
    assert_equal next_node, @node.next
  end

  def test_error
    assert_raises StandardError do
      @node.next = 2
    end
  end
end
