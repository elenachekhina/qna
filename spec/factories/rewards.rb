FactoryBot.define do
  factory :reward do
    name { "Reward name" }
    after(:build) do |reward|
      reward.file.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'star.png')), filename: 'star.png', content_type: 'image/png')
    end
  end
end
