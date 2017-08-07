require_relative 'renderer_1'
require_relative 'renderer_2'

class RendererFactory
  def self.make_renderer(symbol, output_device)
    case symbol
      when :renderer1 then Renderer1.new output_device
      when :renderer2 then Renderer2.new output_device
    end
  end
end