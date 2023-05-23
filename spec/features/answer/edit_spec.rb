require 'rails_helper'

feature 'User can edit his answer', %q{
  In order to edit incorrect answer
  As an authenticated user
  I'd like to be able to edit my answer
} do

  given!(:user) {create(:user)}
  given!(:other_user) {create(:user)}
  given!(:question) {create(:question, author: user)}
  given!(:answer) { create(:answer, question: question, author: user, with_attachment: true) }

  describe 'Authenticated user tries to edit his answer', js: true do
    background do
      sign_in(user)
      visit questions_path
    end

    scenario 'edit answer without errors' do
      visit question_path(question)

      within '#answers' do
        click_on "#{answer.body}"
      end

      form = find("turbo-frame[id=inline_answer_#{answer.id}]")
      within form do
        fill_in :answer_body, with: 'New answer body'
        click_button 'Answer'
      end

      expect(page).not_to have_content answer.body
      expect(page).to have_content 'New answer body'
      expect(page).not_to have_selector "#inline_answer_#{answer.id}"
    end

    scenario 'edit answer with errors' do
      visit question_path(question)

      within '#answers' do
        click_on "#{answer.body}"
      end

      form = find("turbo-frame[id=inline_answer_#{answer.id}]")
      within form do
        fill_in :answer_body, with: ''
        click_button 'Answer'
      end

      expect(page).to have_content answer.body
      expect(page).to have_content "Body can't be blank"
      expect(page).to have_selector 'textarea'
    end

    scenario 'delete answer`s files' do
      visit question_path(question)

      within '#answers' do
        click_on "#{answer.body}"
        uncheck('rails_helper.rb', allow_label_click: true)
        click_button 'Answer'
      end

      expect(page).not_to have_link 'rails_helper.rb'
    end
  end

  scenario 'Authenticated user tries to edit not his answer', js: true do
    sign_in(user)
    other_answer = create :answer, question: question, author: other_user
    visit question_path(question)

    within '#answers' do
      expect(page).not_to have_link "#{other_answer.body}"
    end
  end

  scenario 'Unauthenticated user tries to edit answer', js: true do
    visit question_path(question)

    within '#answers' do
      expect(page).not_to have_link "#{answer.body}"
    end
  end
end
