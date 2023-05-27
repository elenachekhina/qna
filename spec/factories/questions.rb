# frozen_string_literal: true

FactoryBot.define do
  sequence :title do |n|
    "MyTitle#{n}"
  end

  sequence :body do |n|
    "MyBody#{n}"
  end

  factory :question do
    association :author_id, factory: :user

    title
    body

    transient do
      with_attachment { false }
    end

    after(:build) do |question, evaluator|
      if evaluator.with_attachment
        question.files.attach(io: File.open("#{Rails.root}/spec/rails_helper.rb"), filename: 'rails_helper.rb')
      end
    end
  end

  trait :invalid do
    title { nil }
  end
end
