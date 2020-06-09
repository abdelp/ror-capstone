require 'rails_helper'

RSpec.describe "time_entries/edit", type: :view do
  before(:each) do
    @time_entry = assign(:time_entry, TimeEntry.create!(
      author_id: "",
      name: "MyString",
      amount: 1,
      group: nil
    ))
  end

  it "renders the edit time_entry form" do
    render

    assert_select "form[action=?][method=?]", time_entry_path(@time_entry), "post" do

      assert_select "input[name=?]", "time_entry[author_id]"

      assert_select "input[name=?]", "time_entry[name]"

      assert_select "input[name=?]", "time_entry[amount]"

      assert_select "input[name=?]", "time_entry[group_id]"
    end
  end
end
