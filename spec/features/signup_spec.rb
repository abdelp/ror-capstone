require 'rails_helper'

RSpec.describe User, driver: :selenium_chrome, js: true do
  let(:user) { attributes_for(:user) }

  describe 'the signup process' do
    it 'registers a user' do
      visit signup_path

      within('#new_user') do
        attach_file('change-img-field', '/tmp/profile.jpeg', make_visible: true)
        fill_in 'Full name', with: user[:full_name]
        fill_in 'Username', with: user[:name]
        fill_in 'Email', with: user[:email]
        fill_in 'Password', with: user[:password]
      end

      click_button 'Signup'
      expect(page.get_rack_session_key('user_id')).to eq(1)
    end
  end
end