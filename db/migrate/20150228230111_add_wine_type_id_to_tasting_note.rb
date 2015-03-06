class AddWineTypeIdToTastingNote < ActiveRecord::Migration
  def change
    add_column :tasting_notes, :wine_type_id, :integer
  end
end
