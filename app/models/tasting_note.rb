class TastingNote < ActiveRecord::Base
  belongs_to :user
  belongs_to :wine
  belongs_to :wine_type
  has_many :tasting_note_flavors
  has_many :flavors, -> { order("created_at") }, through: :tasting_note_flavors
  has_many :tasting_note_aromas
  has_many :aromas, -> { order("created_at") }, through: :tasting_note_aromas
  validates_presence_of :tasting_date
  validates_presence_of :quality
  validates_presence_of :comments
end