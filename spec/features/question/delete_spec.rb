require 'rails_helper'

feature 'User can delete his questions', %q{
  In order to any reason
  As an authorised user
  I'd like to be able to delete my questions
} do

  given(:users) { create_list(:user, 2) }
  given!(:question_1) { create(:question, author: users[0]) }
  given!(:question_2) { create(:question, author: users[1]) }

  describe 'Authenticated user' do
    background do
      sign_in(users[0])
    end

    scenario 'tries to delete his question' do
      visit question_path(question_1)
      click_on 'Delete question'

      expect(page).to have_content 'Question was successfully deleted'
    end

    scenario 'tries to delete not his question' do
      visit question_path(question_2)

      expect(page).not_to have_button 'Delete question'
    end
  end

  describe 'Unauthenticated user' do
    scenario 'tries to delete any question' do
      visit question_path(question_1)

      expect(page).not_to have_button 'Delete question'
    end
  end

end