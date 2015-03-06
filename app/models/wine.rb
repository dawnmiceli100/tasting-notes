class Wine < ActiveRecord::Base
  belongs_to :wine_type
  has_many :tasting_notes

  validates_presence_of :description
  validates_presence_of :wine_type_id
  validates_uniqueness_of :description, scope: :vintage
  validates_inclusion_of :vintage, 
    in: 1945..Date.today.strftime("%Y").to_i, 
    message: "must be between 1945 and this year.",
    allow_blank: true

end