class CreateTastingNotes < ActiveRecord::Migration
  def change
    create_table :tasting_notes do |t|
      t.datetime :tasting_date
      t.string :color
      t.string :color_intensity
      t.string :clarity
      t.string :aroma_intensity
      t.string :sweetness
      t.string :acidity
      t.string :tannin
      t.string :body
      t.string :finish
      t.timestamps
    end
  end
end
