require_relative 'human_interface_1'
require_relative 'human_interface_2'
class HumanInterfaceFactory
  def self.make_interface(symbol)
    case symbol
      when :interface1 then HumanInterface1.new
      when :interface2 then HumanInterface2.new
    end
  end
end