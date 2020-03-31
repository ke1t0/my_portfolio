50.times do |n|
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


# # フォロー
users = User.all
user = users.last
following = users[30..50]
followers = users[40..45]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

# # いいね
# user2 = users.second
# posts = Post.all
# post = Post.last
# like_post1 = Post.ids.sort[220..253]
# like_post1.each {|like| user.likes.create!(post_id: like)}

# like_post2 = Post.ids.sort[230..240]
# like_post2.each {|like| user2.likes.create!(post_id: like)}

# # コメント
# # users = User.order(:created_at).take(6)
# # comments = Faker::Lorem.sentence
# # users.each {|user| user.comments.create!(post_id: post.id, text: comments)}

# # 2.times do
#   text = Faker::Lorem.sentence
#   # users = User.order(:created_at).take(6)
#   # users.each {|user| user.comments.create!(post_id: post.id, text: text)}
# # end


# # post2 = Post.find(304)
# post_id = posts[250..254]
# post_id.each {|post| user.comments.create!(post_id: post.id, text: text)}
