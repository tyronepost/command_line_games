require_relative '../../test_helper'

class RendererFactoryTest < Minitest::Test
  def test_make_renderer
    @io_device = IODeviceSpy.new
    assert RendererFactory.make_renderer(:renderer1, @io_device).is_a?(Renderer1)
    assert RendererFactory.make_renderer(:renderer2, @io_device).is_a?(Renderer2)
  end
end