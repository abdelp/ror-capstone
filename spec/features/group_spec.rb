require 'rails_helper'

RSpec.describe Group, driver: :selenium_chrome, js: true do
  let(:user) { create(:user) }
  let(:group) { attributes_for(:group) }
  before(:each) do
    page.set_rack_session(user_id: user.id)
  end

  describe 'the group management process' do
    it 'creates a group' do
      visit new_group_path
      attach_file('change-img-field', '/tmp/profile.jpeg', make_visible: true)

      fill_in 'Name', with: group[:name]

      click_on 'Create'
      sleep(3)
      expect(page).to have_content 'Group was successfully created.'
    end
  end
end
