require 'rails_helper'

feature 'User can delete his answers', %q{
  In order to any reason
  As an authorised user
  I'd like to be able to delete my answers
} do

  given(:users) { create_list(:user, 2) }
  given(:question) { create(:question, author: users[0]) }

  describe 'Authenticated user', js: true do
    background do
      sign_in(users[0])
      visit questions_path
    end

    scenario 'tries to delete his answer' do
      answer = create :answer, question: question, author: users[0]
      visit question_path(question)

      within '#answers' do
        click_on 'Delete'
      end

      expect(page).not_to have_content answer.body
      expect(page).to have_content 'Answer was successfully deleted'
    end

    scenario 'tries to delete not his answer' do
      create :answer, question: question, author: users[1]
      visit question_path(question)

      within '#answers' do
        expect(page).not_to have_button 'Delete'
      end
    end
  end

  describe 'Unauthenticated user', js: true do
    scenario 'tries to delete any question' do
      create :answer, question: question, author: users[0]
      visit question_path(question)
      within '#answers' do
        expect(page).not_to have_button 'Delete'
      end
    end
  end

end