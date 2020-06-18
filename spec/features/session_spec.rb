require 'rails_helper'

RSpec.describe User, driver: :selenium_chrome, js: true do
  let(:user) { attributes_for(:user) }
  let(:user_login) { create(:user) }

  describe 'the signup process' do
    it 'registers a user' do
      visit signup_path

      within('#new_user') do
        attach_file('change-img-field', '/tmp/profile.png', make_visible: true)
        fill_in 'Full name', with: user[:full_name]
        fill_in 'Username', with: user[:name]
        fill_in 'Email', with: user[:email]
        fill_in 'Password', with: user[:password]
      end

      click_button 'Signup'
      sleep(3)
      expect(page.get_rack_session_key('user_id')).to eq(1)
    end

    it 'rejects user registration when full name is not specified' do
      visit signup_path

      within('#new_user') do
        attach_file('change-img-field', '/tmp/profile.png', make_visible: true)
        fill_in 'Username', with: user[:name]
        fill_in 'Email', with: user[:email]
        fill_in 'Password', with: user[:password]
      end

      click_button 'Signup'
      sleep(3)
      expect(page).to have_content("Full name can't be blank")
    end

    it 'rejects user registration when name is not specified' do
      visit signup_path

      within('#new_user') do
        attach_file('change-img-field', '/tmp/profile.png', make_visible: true)
        fill_in 'Full name', with: user[:full_name]
        fill_in 'Email', with: user[:email]
        fill_in 'Password', with: user[:password]
      end

      click_button 'Signup'
      sleep(3)
      expect(page).to have_content("Name can't be blank")
    end

    it 'rejects user registration when email is not specified' do
      visit signup_path

      within('#new_user') do
        attach_file('change-img-field', '/tmp/profile.png', make_visible: true)
        fill_in 'Full name', with: user[:full_name]
        fill_in 'Username', with: user[:name]
        fill_in 'Password', with: user[:password]
      end

      click_button 'Signup'
      sleep(3)
      expect(page).to have_content("Email can't be blank")
    end

    it 'user can login with just username' do
      visit login_path
      within('#login_form') do
        fill_in 'Username', with: user_login.name
      end

      click_button 'Log in'
      sleep(3)
      expect(page.get_rack_session_key('user_id')).to eq(2)
    end

    it 'rejects user access when it is not provided a username' do
      visit login_path

      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Invalid username')
    end

    it 'rejects user access when username is not registered' do
      visit login_path

      within('#login_form') do
        fill_in 'Username', with: 'inexistent_user'
      end

      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Invalid username')
    end

    it 'logout user' do
      page.set_rack_session(user_id: user_login.id)
      visit root_path

      find('#sidebarCollapse').click
      click_on 'Log out'
      sleep(3)
      expect { page.get_rack_session_key('user_id') }.to raise_error(KeyError)
    end
  end
end
