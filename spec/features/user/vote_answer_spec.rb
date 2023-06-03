# frozen_string_literal: true

require 'rails_helper'

feature 'User can vote for an answer', "
  In order to help others find working answer
  As an authenticated user
  I'd like to be able to vote for an answer
" do
  given!(:user) { create(:user) }
  given!(:question) { create(:question, author: user) }
  given!(:answer_author) { create(:user) }
  given!(:answer) { create(:answer, question: question, author: answer_author) }

  describe 'Authenticated user, not author' do
    background do
      sign_in(user)
      visit questions_path
    end

    scenario 'User vote for', js: true do
      visit question_path(question)

      within '#answers' do
        click_on '↑'
      end

      within '#answers' do
        expect(page).to have_content '1'
      end
    end

    scenario 'User vote against', js: true do
      visit question_path(question)

      within '#answers' do
        click_on '↓'
      end

      within '#answers' do
        expect(page).to have_content '-1'
      end
    end

    scenario 'User cancel voices for and against', js: true do
      visit question_path(question)

      within '#answers' do
        click_on '↑'
        click_on '↑'
        click_on '↓'
        click_on '↓'
      end

      within '#answers' do
        expect(page).to have_content '0'
      end
    end
  end

  describe 'Authenticated user, not author' do
    background do
      sign_in(answer_author)
      visit questions_path
    end

    scenario 'Author try to vote for/against', js: true do
      visit question_path(question)

      within '#answers' do
        expect(page).not_to have_button '↑'
        expect(page).not_to have_button '↓'
      end
    end
  end

  describe 'Not authenticated user' do
    scenario 'User try to vote for/against', js: true do
      visit question_path(question)

      within '#answers' do
        expect(page).not_to have_button '↑'
        expect(page).not_to have_button '↓'
      end
    end
  end
end
