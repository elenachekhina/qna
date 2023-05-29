# frozen_string_literal: true

require 'rails_helper'

feature 'User can view the question`s list`', "
  In order to find a similar question
  As an any user
  I'd like to be able to view the question`s list
" do
  given(:user) { create(:user) }
  given!(:questions) { create_list(:question, 2, author: user) }

  scenario 'Authenticated user tries to view list of questions' do
    sign_in(user)
    visit questions_path

    expect(page).to have_content questions[0].body
    expect(page).to have_content questions[1].body
  end

  scenario 'Unauthenticated user tries to view list of questions' do
    visit questions_path

    expect(page).to have_content questions[0].body
    expect(page).to have_content questions[1].body
  end
end
