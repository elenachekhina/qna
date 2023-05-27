require 'rails_helper'

feature 'User can receive a reward', %q{
  In order to recieve points
  As an authenticated user
  I'd like to be able to receive a reward for best answer
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, author: user) }
  given!(:reward) { create(:reward, question: question) }
  given(:answer_author) { create(:user) }

  background do
    sign_in(answer_author)
    visit questions_path
  end

  scenario 'User`s answer marked as best' do
    create(:answer, question: question, author: answer_author, mark: true)

    visit rewards_path

    expect(page).to have_content reward.name
    expect(page).to have_content reward.question.title
  end

  scenario 'User`s answer not marked as best' do
    create(:answer, question: question, author: answer_author, mark: false)

    visit rewards_path

    expect(page).not_to have_content reward.name
    expect(page).not_to have_content reward.question.title
  end
end
