class AddForeignKeysToTastingNotes < ActiveRecord::Migration
  def change
    add_column :tasting_notes, :user_id, :integer
    add_column :tasting_notes, :wine_id, :integer
  end
end
