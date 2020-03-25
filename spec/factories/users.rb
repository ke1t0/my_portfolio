FactoryBot.define do
  factory :user do
    name {"Test User"}
    sequence(:email) {|n| "test#{n}@test.com"}
    password {"password"}
    introduction {"a" * 140}
    # association :post
    # post {user.posts}
  end
end
