# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    association :question, factory: :question

    sequence :body do |n|
      "MyAnswerBody#{n}"
    end

    transient do
      with_attachment { false }
    end

    after(:build) do |answer, evaluator|
      if evaluator.with_attachment
        answer.files.attach(io: File.open("#{Rails.root}/spec/rails_helper.rb"), filename: 'rails_helper.rb')
      end
    end
  end

  trait :answer_invalid do
    body { nil }
  end
end
