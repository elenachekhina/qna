# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, foreign_key: 'author_id', class_name: 'Question', dependent: :destroy, inverse_of: :author
  has_many :answers, foreign_key: 'author_id', class_name: 'Answer', dependent: :destroy, inverse_of: :author
  has_many :votes, dependent: :destroy

  scope :all_rewards, ->(user) { Reward.joins(question: :answers).where(answers: { mark: true, author: user }) }

  def author_of?(post)
    post.author == self
  end

  def rewards
    User.all_rewards(self)
  end
end
