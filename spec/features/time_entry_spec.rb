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
      select 'mystring', from: 'time_entry_group_id'

      click_on 'Create'
      sleep(3)
      expect(page).to have_content 'Time entry was successfully created.'
    end

    it "rejects from saving time entry when it's not indicated the name" do
      visit new_time_entry_path

      fill_in 'Start time', with: time_entry[:start_time]
      fill_in 'End time', with: time_entry[:end_time]

      click_on 'Create'
      sleep(3)
      expect(page).to have_content "Name can't be blank"
    end

    it "rejects from saving time entry when it's not indicated the starting time" do
      visit new_time_entry_path

      fill_in 'Description', with: time_entry[:name]
      fill_in 'End time', with: time_entry[:end_time]

      click_on 'Create'
      sleep(3)
      expect(page).to have_content "Start time can't be blank"
    end

    it "rejects from saving time entry when it's not indicated the ending time" do
      visit new_time_entry_path

      fill_in 'Description', with: time_entry[:name]
      fill_in 'Start time', with: time_entry[:start_time]

      click_on 'Create'
      sleep(3)
      expect(page).to have_content "End time can't be blank"
    end

    it 'rejects from save when end_time is less than start_time' do
      visit new_time_entry_path

      fill_in 'Description', with: time_entry[:name]
      fill_in 'Start time', with: time_entry[:end_time]
      fill_in 'End time', with: time_entry[:start_time]

      click_on 'Create'
      sleep(3)
      expect(page).to have_content "end time can't be equal or less than start_time"
    end

    it 'saves even when no group is selected' do
      visit new_time_entry_path

      fill_in 'Description', with: time_entry[:name]
      fill_in 'Start time', with: time_entry[:start_time]
      fill_in 'End time', with: time_entry[:end_time]

      click_on 'Create'
      sleep(3)
      expect(page).to have_content 'Time entry was successfully created.'
    end
  end
end
