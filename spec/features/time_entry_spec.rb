require 'rails_helper'

RSpec.describe TimeEntry, driver: :selenium_chrome, js: true do
  let(:user) { create(:user) }
  let(:time_entry) { attributes_for(:time_entry) }

  before(:each) do
    create(:group)
    page.set_rack_session(user_id: user.id)
  end

  describe 'the time entry management process' do
    it 'creates a time entry' do
      visit new_time_entry_path

      fill_in 'Description', with: time_entry[:name]
      fill_in 'Start time', with: time_entry[:start_time]
      fill_in 'End time', with: time_entry[:end_time]
      select 'MyString', from: 'time_entry_group_id'
      click_on 'Create'
      expect(page).to have_content 'Time entry was successfully created.'
    end
  end
end
