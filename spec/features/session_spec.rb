require 'rails_helper'

RSpec.describe User, driver: :selenium_chrome, js: true do
  let(:user) { attributes_for(:user) }
  let(:user_login) { create(:user) }

  describe 'the signup process' do
    it 'registers a user' do
      visit new_user_registration_path

      within('#new_user') do
        attach_file('change-img-field', "#{Rails.root}/app/assets/images/profile.png", make_visible: true)
        fill_in 'Full name', with: user[:name]
        fill_in 'Email', with: user[:email]
        fill_in 'Password', with: user[:password]
        fill_in 'Confirm password', with: user[:password]
      end

      click_button 'Sign up'
      sleep(3)

      p page.status_code
      expect(current_page?('/')).to be_truthy
    end

    # it 'rejects user registration when name is not specified' do
    #   visit signup_path

    #   within('#new_user') do
    #     fill_in 'Email', with: user[:email]
    #     fill_in 'Password', with: user[:password]
    #     fill_in 'Confirm password', with: user[:password]
    #   end

    #   click_button 'Signup'
    #   sleep(3)
    #   expect(page).to have_content("Name can't be blank")
    # end

    # it 'rejects user registration when password doesn\'t match password confirmation' do
    #   visit signup_path

    #   within('#new_user') do
    #     fill_in 'Full name', with: user[:name]
    #     fill_in 'Email', with: user[:email]
    #     fill_in 'Password', with: user[:password]
    #     fill_in 'Confirm password', with: 'another_password'
    #   end

    #   click_button 'Signup'
    #   sleep(3)
    #   expect(page).to have_content("Password confirmation doesn't match Password")
    # end

    # it 'rejects user registration when email is not specified' do
    #   visit signup_path

    #   within('#new_user') do
    #     fill_in 'Full name', with: user[:name]
    #     fill_in 'Password', with: user[:password]
    #   end

    #   click_button 'Signup'
    #   sleep(3)
    #   expect(page).to have_content("Email can't be blank")
    # end

    # it 'user can login with email and password' do
    #   visit login_path
    #   within('#login_form') do
    #     fill_in 'Email', with: user_login.email
    #     fill_in 'Password', with: '123456'
    #   end

    #   click_button 'Log in'
    #   sleep(3)
    #   expect(page.get_rack_session_key('user_id')).to eq(2)
    # end

    # it 'rejects user access when it is not provided the email' do
    #   visit login_path

    #   within('#login_form') do
    #     fill_in 'Password', with: '123456'
    #   end
    #   click_button 'Log in'
    #   sleep(3)
    #   expect(page).to have_content('Invalid email and password combination')
    # end

    # it 'rejects user access when email is not registered' do
    #   visit login_path

    #   within('#login_form') do
    #     fill_in 'Email', with: 'inexistent_user@test.com'
    #     fill_in 'Password', with: '123456'
    #   end

    #   click_button 'Log in'
    #   sleep(3)
    #   expect(page).to have_content('Invalid email and password combination')
    # end

    # it 'rejects user access when password is not provided' do
    #   visit login_path

    #   within('#login_form') do
    #     fill_in 'Email', with: 'inexistent_user@test.com'
    #   end

    #   click_button 'Log in'
    #   sleep(3)
    #   expect(page).to have_content('Invalid email and password combination')
    # end

    # it 'logout user' do
    #   page.set_rack_session(user_id: user_login.id)
    #   visit root_path

    #   find('#sidebarCollapse').click
    #   click_on 'Log out'
    #   sleep(3)
    #   expect { page.get_rack_session_key('user_id') }.to raise_error(KeyError)
    # end
  end
end
