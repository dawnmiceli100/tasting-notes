class AddFlavorIntensityToTastingNotes < ActiveRecord::Migration
  def change
    add_column :tasting_notes, :flavor_intensity, :string
  end
end
