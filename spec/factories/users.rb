FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    gravatar_url { Faker::Avatar.image }
    password { '123456' }
  end
end
