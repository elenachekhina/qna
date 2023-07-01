FactoryBot.define do
  factory :comment do
    user
    body { 'Comment' }
  end
end
