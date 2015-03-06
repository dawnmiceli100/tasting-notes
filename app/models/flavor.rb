class Flavor < ActiveRecord::Base
  has_many :tasting_note_flavors
  has_many :tasting_notes, through: :tasting_note_flavors

  validates_presence_of :name
  validates_uniqueness_of :name
end