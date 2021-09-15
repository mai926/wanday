FactoryBot.define do
  factory :post do
    caption {'test'}
    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/test_pic.png'), filename: 'test_pic.png')
    end
  end
end
