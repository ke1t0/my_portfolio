FactoryBot.define do
  factory :user do
    name {"Test User"}
    sequence(:email) {|n| "test#{n}@test.com"}
    password {"password"}
    introduction {"a" * 140}
    image {"nature-2576652_1280.jpg"}
    admin {false}
    # association :post
    # post {user.posts}

    trait :admin do
      admin {true}
    end
  end
end
