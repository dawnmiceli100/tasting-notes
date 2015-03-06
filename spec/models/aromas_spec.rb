require 'rails_helper'

describe Aroma do
  it { should have_many(:tasting_note_aromas) }
  it { should have_many(:tasting_notes).through(:tasting_note_aromas)}
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) } 
end