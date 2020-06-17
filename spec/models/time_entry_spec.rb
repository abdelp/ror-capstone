require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  it { should validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should belong_to(:author).required(true) }
  it { should belong_to(:group).required(false) }
end
