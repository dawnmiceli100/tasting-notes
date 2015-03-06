class CreateTastingNoteAromas < ActiveRecord::Migration
  def change
    create_table :tasting_note_aromas do |t|
      t.integer :tasting_note_id
      t.integer :aroma_id
      t.timestamps
    end
  end
end
