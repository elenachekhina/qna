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
  end

  trait :invalid do
    title { nil }
  end
end
