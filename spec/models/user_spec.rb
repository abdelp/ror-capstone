require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:time_entries).inverse_of(:author).dependent(:destroy) }
  it { should have_many(:groups).dependent(:destroy) }

  it do
    create(:user)
    should validate_uniqueness_of(:email).ignoring_case_sensitivity
  end
end
