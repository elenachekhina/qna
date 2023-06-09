# frozen_string_literal: true

class Question < ApplicationRecord
  include Votable
  include Commentable

  after_create_commit lambda {
                        broadcast_append_to 'questions', partial: 'questions/question_broadcast', locals: { question: self },
                                                         target: 'questions'
                      }

  has_many :answers, dependent: :destroy
  belongs_to :author, class_name: 'User'
  has_many :links, dependent: :destroy, as: :linkable
  has_one :reward, dependent: :destroy

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :reward, reject_if: :all_blank, allow_destroy: true

  has_many_attached :files

  validates :title, :body, presence: true
end
