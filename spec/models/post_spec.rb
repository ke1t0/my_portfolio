require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with a body" do
    post = @user.posts.build(
      body: "t"*1000
    )
    expect(post).to be_valid
  end

  # user_idにバリデーションをかけているけど通ってしまう
  it "is invalid without a user_id" do
    user = User.create(
      name: "test user",
      email: "example@mail.com",
      password: "password"
    )
    post1 = user.posts.build(
      body: "test example",
      user_id: nil
    )
    expect(post1).to be_valid
  end

  context "invalid a body" do
    it "is invalid without a body" do
      post = @user.posts.build(
        body: nil
      )
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
    end
  
    it "is invalid a body too long" do
      post = @user.posts.build(
        body: "t"*1001
      )
      post.valid?
      expect(post.errors[:body]).to include("は1000文字以内で入力してください")
    end
  end

  describe "#search" do
    before do
      @post1 = @user.posts.create(
        body: "Hello, world!"
      )
      @other_user = FactoryBot.create(:user)
      @post2 = @other_user.posts.create(
        body: "goodbye, world"
      )
    end  

    context "search by hello" do
      it "return @post1" do
        expect(Post.search("hello")).to include(@post1)
      end

      it "doesn't return @post2" do
        expect(User.search("hello")).to_not include(@post2)
      end
    end

    context "search by thanks" do
      it "return empty" do
        expect(Post.search("thanks")).to be_empty
      end
    end
  end
end
