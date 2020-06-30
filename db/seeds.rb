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

User.create!(
  name: "Test User",
  email: "test@test.mail",
  password: "password",
  image: open("#{Rails.root}/db/fixtures/sports_tennis.png"),
  introduction: "テストユーザーです。"
)

users = User.order(:created_at)
5.times do
  body = Faker::Lorem.sentence
  image = open("#{Rails.root}/db/fixtures/nature-2576652_1280.jpg")
  users.each{|user| user.posts.create!(body: body, image: image)}
end

last_user = User.find_by(name: "Test User")
last_user.posts.create!(
  body: "ポジションをどっちにするか迷っている方へ

  後衛の楽しさ
  ✅試合展開をコントロールできる
  ✅前衛よりも多く球を打てる
  ✅前衛の逆を突いた時
  
  前衛の楽しさ
  ✅アグレッシブなプレー
  ✅得点源になれる
  ✅相手後衛を惑わす事ができる
  
  参考になれば嬉しいです！",
  image: open("#{Rails.root}/db/fixtures/sports_tennis.png")
)

# フォロー
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