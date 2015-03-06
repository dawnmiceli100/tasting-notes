class AddQualityAndCommentsToTastingNotes < ActiveRecord::Migration
  def change
    add_column :tasting_notes, :quality, :string
    add_column :tasting_notes, :comments, :text
  end
end
