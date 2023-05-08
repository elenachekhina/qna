class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, dependent: :destroy, foreign_key: 'author_id', class_name: 'Question', dependent: :destroy, inverse_of: :author
  has_many :answers, dependent: :destroy, foreign_key: 'author_id', class_name: 'Answer', dependent: :destroy, inverse_of: :author

  def author_of?(post)
    post.author == self
  end
end
