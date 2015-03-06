class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :description
      t.integer :vintage
      t.integer :wine_type_id
      t.timestamps
    end
  end
end
