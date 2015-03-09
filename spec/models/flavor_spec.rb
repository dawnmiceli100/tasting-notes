require 'rails_helper'

describe Flavor do
  it { is_expected.to have_many(:tasting_note_flavors) }
  it { is_expected.to have_many(:tasting_notes).through(:tasting_note_flavors) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end