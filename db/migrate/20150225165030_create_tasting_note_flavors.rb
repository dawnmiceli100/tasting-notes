class CreateTastingNoteFlavors < ActiveRecord::Migration
  def change
    create_table :tasting_note_flavors do |t|
      t.integer :tasting_note_id
      t.integer :flavor_id
      t.timestamps
    end
  end
end
