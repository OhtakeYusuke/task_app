FactoryBot.define do
  factory :task do
    name {Faker::App.name}
    description {Faker::Lorem.paragraph}
    user
  end
end
