require 'rails_helper'

describe TastingNote do
  it { should belong_to(:user) }
  it { should belong_to(:wine) }
  it { should belong_to(:wine_type) }
  it { should have_many(:tasting_note_flavors) }
  it { should have_many(:flavors).through(:tasting_note_flavors) }
  it { should have_many(:tasting_note_aromas) }
  it { should have_many(:aromas).through(:tasting_note_aromas) }
  it { should validate_presence_of(:tasting_date) }
  it { should validate_presence_of(:quality) }
  it { should validate_presence_of(:comments) }
end