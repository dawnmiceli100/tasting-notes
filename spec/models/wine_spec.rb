require 'rails_helper'

describe Wine do 
  it { should belong_to(:wine_type) }
  it { should have_many(:tasting_notes) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:wine_type_id) }
  it { should validate_uniqueness_of(:description).scoped_to(:vintage) }
  it { should validate_inclusion_of(:vintage).in_range(1945..Date.today.strftime("%Y").to_i).with_message("must be between 1945 and this year.").allow_blank}
end