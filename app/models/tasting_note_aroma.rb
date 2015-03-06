class TastingNoteAroma < ActiveRecord::Base
  belongs_to :tasting_note
  belongs_to :aroma
end