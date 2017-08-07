require_relative 'easy_ai_behavior'
require_relative 'medium_ai_behavior'
require_relative 'hard_ai_behavior'

class AIBehaviorFactory
  def self.make_behavior(symbol)
    case symbol
      when :easy
        EasyAIBehavior.new
      when :medium
        MediumAIBehavior.new
      when :hard
        HardAIBehavior.new
    end
  end
end