require 'rails_helper'

RSpec.describe "time_entries/show", type: :view do
  before(:each) do
    @time_entry = assign(:time_entry, TimeEntry.create!(
      author_id: "",
      name: "Name",
      amount: 2,
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
