# frozen_string_literal: true

require 'rails_helper'

feature 'User can sign in', "
  In order to ask questions
  As an unauthenticated user
  I'd like to be able to sign in
" do

  background { visit new_user_session_path }

  describe 'Registered user tries to sign in' do
    given!(:user) { create(:user) }

    scenario 'with email' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'

      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'with github' do
      expect(page).to have_content("Sign in with GitHub")
      mock_auth(:github, 'test@test.com')
      click_button "Sign in with GitHub"
      expect(page).to have_content("Successfully authenticated from Github account.")
    end

    scenario 'with vk' do
      expect(page).to have_content("Sign in with Vkontakte")
      mock_auth(:vkontakte)
      click_button "Sign in with Vkontakte"
      fill_in :email, with: user.email
      click_on 'Send'

      expect(page).to have_content("Email has already been taken")
    end
  end

  describe 'Unregistered user tries to sign in' do
    scenario 'with email' do
      fill_in 'Email', with: 'wrong@test.com'
      fill_in 'Password', with: '12345678'
      click_on 'Log in'

      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'with github' do
      expect(page).to have_content("Sign in with GitHub")
      mock_auth(:github, 'test@test.com')
      click_button "Sign in with GitHub"
      expect(page).to have_content("Successfully authenticated from Github account.")
    end

    scenario 'with vk' do
      expect(page).to have_content("Sign in with Vkontakte")
      mock_auth(:vkontakte)
      click_button "Sign in with Vkontakte"
      fill_in :email, with: 'test@test.com'
      click_on 'Send'

      open_email('test@test.com')
      current_email.click_link('Confirm Email')
      expect(page).to have_content("Email confirmed successfully")
    end
  end


end
