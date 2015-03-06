require 'rails_helper'

describe WineType do
  it { should have_many(:wines) }
  it { should have_many(:tasting_notes) } 
  it { should validate_presence_of(:name) } 
  it { should validate_uniqueness_of(:name) }
end