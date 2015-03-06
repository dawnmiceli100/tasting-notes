class TastingNoteFlavor < ActiveRecord::Base
  belongs_to :tasting_note
  belongs_to :flavor
end