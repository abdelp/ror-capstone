require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:user).required(true) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it do
    create(:group)
    should validate_uniqueness_of(:name).ignoring_case_sensitivity
  end
end
