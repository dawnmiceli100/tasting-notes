require 'rails_helper'

describe TastingNoteFlavor do
  it { should belong_to(:tasting_note) }
  it { should belong_to(:flavor) }
end
