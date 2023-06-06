# frozen_string_literal: true

require 'rails_helper'

feature 'User can vote for a question', "
  In order to help others find good question
  As an authenticated user
  I'd like to be able to vote for a question
" do
  given!(:user) { create(:user) }
  given!(:question_author) { create(:user) }
  given!(:question) { create(:question, author: question_author) }

  describe 'Authenticated user, not author' do
    background do
      sign_in(user)
      visit questions_path
    end

    scenario 'User vote for', js: true do
      visit questions_path

      within("#question_#{question.id}_votes") do
        click_on '↑'
      end

      within("#question_#{question.id}_votes") do
        expect(page).to have_content '1'
      end
    end

    scenario 'User vote against', js: true do
      visit questions_path
      within("#question_#{question.id}_votes") do
        click_on '↓'
      end

      within("#question_#{question.id}_votes") do
        expect(page).to have_content '-1'
      end
    end

    scenario 'User cancel voices for and against', js: true do
      visit questions_path

      within("#question_#{question.id}_votes") do
        click_on '↑'
        click_on '↑'
        click_on '↓'
        click_on '↓'
      end

      within("#question_#{question.id}_votes") do
        expect(page).to have_content '0'
      end
    end
  end

  describe 'Authenticated user, not author' do
    background do
      sign_in(question_author)
      visit questions_path
    end

    scenario 'Author try to vote for/against', js: true do
      visit questions_path

      within("#question_#{question.id}_votes") do
        expect(page).not_to have_button '↑'
        expect(page).not_to have_button '↓'
      end
    end
  end

  describe 'Not authenticated user' do
    scenario 'User try to vote for/against', js: true do
      visit questions_path

      within("#question_#{question.id}_votes") do
        expect(page).not_to have_button '↑'
        expect(page).not_to have_button '↓'
      end
    end
  end
end
