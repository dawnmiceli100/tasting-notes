require 'rails_helper'

describe Flavor do
  it { should have_many(:tasting_note_flavors) }
  it { should have_many(:tasting_notes).through(:tasting_note_flavors)}
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end