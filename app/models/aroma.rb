class Aroma < ActiveRecord::Base
  has_many :tasting_note_aromas
  has_many :tasting_notes, through: :tasting_note_aromas

  validates_presence_of :name
  validates_uniqueness_of :name
end