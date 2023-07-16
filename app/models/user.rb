# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github vkontakte]

  has_many :questions, foreign_key: 'author_id', class_name: 'Question', dependent: :destroy, inverse_of: :author
  has_many :answers, foreign_key: 'author_id', class_name: 'Answer', dependent: :destroy, inverse_of: :author
  has_many :votes, dependent: :destroy
  has_many :authorizations, dependent: :destroy
  has_many :subscriptions, dependent: :destroy, foreign_key: 'subscriber_id', class_name: 'Subscription', inverse_of: :subscriber

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  scope :all_rewards, ->(user) { Reward.joins(question: :answers).where(answers: { mark: true, author: user }) }

  def author_of?(post)
    post.author == self
  end

  def rewards
    User.all_rewards(self)
  end
end
