require 'rails_helper'

describe TastingNoteAroma do
  it { should belong_to(:tasting_note) }
  it { should belong_to(:aroma) }
end