require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        name: "Name",
        icon: "Icon",
        user: nil
      ),
      Group.create!(
        name: "Name",
        icon: "Icon",
        user: nil
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Icon".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
