require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase
  # give assert an additional name
  # alias :expcet :assert

  # Make a helper method (refactoring)
  # def should_be_invalid(object, message)
  #   assert object.invalid?, message
  # end

  test "new definition won't save when word and meaning aren't entered" do
    definition = Definition.new
    assert definition.invalid?, "saved definition with only one param"
    # assert definition.invalid?, "saved definition without word"
  end

  test "new definition wont save when only meaning is entered" do
    definition = Definition.new(word: nil, meaning: "Meaning")
    assert definition.invalid?, "saved invalid definition; no word"
  end

  test "new definition wont save when only word is entered" do
    definition = Definition.new(word: "Word", meaning: nil)
    assert definition.invalid?, "saved invalid definition; no meaning"
  end

  test "definition saves with valid word and meaning" do
    definition = Definition.new(word: "word", meaning: "meaning")
    assert definition.valid?
  end

  test "new definition is invalid if word already exists" do
    definition = Definition.new(word: "word", meaning: "meaning")
    definition2 = Definition.new(word: "word", meaning: "second meaning")
    definition.save
    assert definition2.invalid?, "saved an invalid duplicate word"
  end

  test "words that greater than 16 characters are fancy" do
    definition = Definition.new(word: "12345678901234567")
    assert definition.fancy?
  end

  test "words that are 16 characters or fewer are not fancy" do
    definition = Definition.new(word: "1234567890123456")
    refute definition.fancy?
  end

end
