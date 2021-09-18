FactoryBot.define do
  factory :user do
    name { 'test' }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
  end
end
