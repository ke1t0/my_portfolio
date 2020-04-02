30.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@main.com"
  password = "password"
  image = open("#{Rails.root}/db/fixtures/nature-2576652_1280.jpg")
  introduction = Faker::Lorem.sentence

  User.create!(
    name: name,
    email: email,
    password: password,
    image: image,
    introduction: introduction
  )
end

User.create!(
  name: "Admin User",
  email: "admin@test.com",
  password: "password",
  image: open("#{Rails.root}/db/fixtures/sports_tennis.png"),
  admin: true
)

users = User.order(:created_at)
5.times do
  body = Faker::Lorem.sentence
  image = open("#{Rails.root}/db/fixtures/sports_tennis.png")
  users.each{|user| user.posts.create!(body: body, image: image)}
end


# フォロー完成
users = User.all
user = users.last
following = users[10..29]
followers = users[20..29]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

# いいね
posts = Post.all
like_post1 = posts[140..153]
like_post1.each {|like| user.likes.create!(post_id: like.id)}

user2 = User.second
like_post2 = posts[148..150]
like_post2.each {|like| user2.likes.create!(post_id: like.id)}

# コメント

comments = Faker::Lorem.sentence
like_post1.each {|post| user.comments.create!(post_id: post.id, text: comments)}

like_post2.each {|post| user2.comments.create!(post_id: post.id, text: comments)}