FactoryBot.define do
  factory :user do
    name {"Test User"}
    sequence(:email) {|n| "test#{n}@test.com"}
    password {"password"}
    introduction {"a" * 140}
    # image {"nature-2576652_1280.jpg"}
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/nature-2576652_1280.jpg')) }
    image {nil}
    admin {false}
    # association :post
    # post {user.posts}

    trait :admin do
      admin {true}
    end

    trait :image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/nature-2576652_1280.jpg')) }
    end
  end
end
