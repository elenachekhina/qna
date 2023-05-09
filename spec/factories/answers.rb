FactoryBot.define do
  factory :answer do
    association :question, factory: :question

    sequence :body do |n|
      "MyBody#{n}"
    end
  end

  trait :answer_invalid do
    body { nil }
  end
end
