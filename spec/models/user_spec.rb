require 'rails_helper'

describe User do
  it { should have_many(:tasting_notes).order("tasting_date") }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:full_name) }
  it { should validate_uniqueness_of(:email) }
end