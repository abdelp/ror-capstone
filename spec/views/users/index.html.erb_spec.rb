require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: "Name",
        gravatar_url: "Gravatar Url"
      ),
      User.create!(
        name: "Name",
        gravatar_url: "Gravatar Url"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Gravatar Url".to_s, count: 2
  end
end
