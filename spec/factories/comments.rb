FactoryBot.define do
  factory :comment do
    text { "Hello world" }
    association :user
    association :post
  end
end
