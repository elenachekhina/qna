require 'rails_helper'

feature 'User can create answer', %q{
  In order to answer the question
  As an authenticated user
  I'd like to be able to create answer on the same page
} do

  given(:user) {create(:user)}
  given(:question) {create(:question, author: user)}

  describe 'Authenticated user tries to answer the question', js: true do
    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'answer the question' do
      fill_in 'Body', with: 'Test answer'
      click_on 'Answer'

      expect(page).to have_content 'Your answer successfully created.'
    end

    scenario 'answer the question with errors' do
      click_on 'Answer'

      expect(page).to have_content "Body can't be blank"
    end
  end

  scenario 'Unauthenticated user tries to answer the question', js: true do
    visit question_path(question)
    click_on 'Answer'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end