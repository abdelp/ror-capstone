require 'rails_helper'

RSpec.describe "time_entries/index", type: :view do
  before(:each) do
    assign(:time_entries, [
      TimeEntry.create!(
        author_id: "",
        name: "Name",
        amount: 2,
        group: nil
      ),
      TimeEntry.create!(
        author_id: "",
        name: "Name",
        amount: 2,
        group: nil
      )
    ])
  end

  it "renders a list of time_entries" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
