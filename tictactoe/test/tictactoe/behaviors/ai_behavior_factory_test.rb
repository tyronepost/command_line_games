require_relative '../../test_helper'

class AIBehaviorFactoryTest < Minitest::Test
  def test_make_behavior
    assert AIBehaviorFactory.make_behavior(:easy).is_a?(EasyAIBehavior)
    assert AIBehaviorFactory.make_behavior(:medium).is_a?(MediumAIBehavior)
    assert AIBehaviorFactory.make_behavior(:hard).is_a?(HardAIBehavior)
  end
end