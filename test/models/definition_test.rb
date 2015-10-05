require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase

  test "new definition wont save without word entered" do
    definition = Definition.new
    assert_not definition.save, "saved definition without word"
  end

  test "new definition wont save without meaning" do
    definition = Definition.new
    assert_not definition.save, "saved definition without meaning"
  end

end
