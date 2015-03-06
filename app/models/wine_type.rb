class WineType < ActiveRecord::Base
  has_many :wines
  has_many :tasting_notes
  validates_presence_of :name
  validates_uniqueness_of :name
end