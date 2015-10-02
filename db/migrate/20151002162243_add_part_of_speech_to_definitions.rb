class AddPartOfSpeechToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :part_of_speech, :string
  end
end
