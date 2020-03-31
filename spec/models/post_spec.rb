require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {create(:user)}

  it "is valid with a body" do
    post = create(:post, body: "a"*1000)
    expect(post).to be_valid
  end

  # user_idにバリデーションをかけているけど通ってしまう
  it "is invalid without a user_id" do
    post1 = create(:post)
    expect(post1).to be_valid
  end

  context "invalid a body" do
    it "is invalid without a body" do
      post = build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
    end
  
    it "is invalid a body too long" do
      post = build(:post, body: "a"*1001)
      post.valid?
      expect(post.errors[:body]).to include("は1000文字以内で入力してください")
    end
  end

  describe "#search" do
    before(:each) do
      @post1 = user.posts.create(
        body: "Hello, world!"
      )
      @other_user = create(:user)
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
