FactoryBot.define do
  factory :post do
    body {"test comment"}
    association :user
    # user {post.user}
  end
end
