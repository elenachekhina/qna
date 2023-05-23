require 'rails_helper'

feature 'User can edit his question', %q{
  In order to edit incorrect question
  As an authenticated user
  I'd like to be able to edit my question
} do

  given!(:user) {create(:user)}
  given!(:other_user) {create(:user)}
  given!(:question) {create(:question, author: user, with_attachment: true)}

  describe 'Authenticated user tries to edit his question', js: true do
    background do
      sign_in(user)
      visit questions_path
    end

    scenario 'edit question without errors' do
      visit question_path(question)

      click_on "Edit question"

      fill_in :question_title, with: 'New question title'
      fill_in :question_body, with: 'New question body'
      click_button 'Ask'

      expect(page).not_to have_content question.body
      expect(page).to have_content 'New question title'
      expect(page).to have_content 'New question body'
    end

    scenario 'edit question with errors' do
      visit question_path(question)

      click_on "Edit question"

      fill_in :question_title, with: ''
      fill_in :question_body, with: ''
      click_button 'Ask'

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Body can't be blank"
      expect(page).to have_selector 'textarea'
    end

    scenario 'delete question`s files' do
      visit question_path(question)

      click_on "Edit question"

      uncheck('rails_helper.rb', allow_label_click: true)
      click_button 'Ask'

      expect(page).not_to have_link 'rails_helper.rb'
    end
  end

  scenario 'Authenticated user tries to edit not his answer', js: true do
    sign_in(user)
    create :question, author: other_user
    visit question_path(question)

    expect(page).not_to have_link "Edit question"
  end

  scenario 'Unauthenticated user tries to edit answer', js: true do
    create :question, author: other_user
    visit question_path(question)

    expect(page).not_to have_link "Edit question"
  end
end
