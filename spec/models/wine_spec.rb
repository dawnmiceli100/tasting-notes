require 'rails_helper'

describe Wine do 
  it { is_expected.to belong_to(:wine_type) }
  it { is_expected.to have_many(:tasting_notes) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:wine_type_id) }
  it { is_expected.to validate_uniqueness_of(:description).scoped_to(:vintage) }
  it { is_expected.to validate_inclusion_of(:vintage)
    .in_range(1945..Date.today.strftime("%Y").to_i)
    .with_message("must be between 1945 and this year.")
    .allow_blank}
end