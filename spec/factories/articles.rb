FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    post { Faker::Lorem.paragraph }
    author
  end
end
