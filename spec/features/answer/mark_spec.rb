require 'rails_helper'

feature 'User can mark best answer on his question', %q{
  In order to help find best solution
  As an authenticated user
  I'd like to be able to mark best answer to my question
} do

  given!(:user) {create(:user)}
  given!(:other_user) {create(:user)}
  given!(:question) {create(:question, author: user)}
  given!(:answers) { create_list(:answer, 2, question: question, author: other_user) }

  describe 'Authenticated user tries to mark best answer on his question', js: true do
    background do
      sign_in(user)
      visit questions_path
    end

    scenario 'mark one answer' do
      visit question_path(question)
      # save_and_open_page
      within "div#answer_#{answers[0].id}" do
        click_on "Mark"
      end

      within "div#answer_#{answers[0].id}" do
        expect(page).to have_content 'Best answer'
      end
      within "div#answer_#{answers[1].id}" do
        expect(page).not_to have_content 'Best answer'
      end
    end

    scenario 'unmark one answer' do
      visit question_path(question)

      within "div#answer_#{answers[0].id}" do
        click_on "Mark"
        click_on "Mark"
      end

      within "div#answer_#{answers[0].id}" do
        expect(page).not_to have_content 'Best answer'
      end
    end

    scenario 'mark other answer' do
      visit question_path(question)

      within "div#answer_#{answers[0].id}" do
        click_on "Mark"
      end

      within "div#answer_#{answers[1].id}" do
        click_on "Mark"
      end

      assert_selector 'div[id="answers"]', wait: 10

      within "div#answer_#{answers[0].id}" do
        expect(page).not_to have_content 'Best answer'
      end
      within "div#answer_#{answers[1].id}" do
        expect(page).to have_content 'Best answer'
      end
    end

    xscenario 'mark answer and it stand first place' do
      visit question_path(question)

      within "div#answer_#{answers[1].id}" do
        click_on "Mark"
      end

      expect(page.body).to match /.*#{answers[1].body}.*#{answers[0].body}.*/m
    end

  end
end
