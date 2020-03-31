require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "#relationship" do
    let(:user) {create(:user)}
    let(:other_user) {create(:user)}

    context "following_id" do
      it "is valid" do
        follow = user.follow(other_user)
        expect(follow).to be_valid
      end
    
      it "is invalid without a following_id" do
        follow = user.following_relationships.build(following_id: nil)
        follow.valid?
    
        expect(follow.errors[:following_id]).to include("を入力してください")
      end
    end

    context "follower_id" do
      it "is invalid without a follower_id" do
        follow = user.follower_relationships.build(follower_id: nil)
        follow.valid?
        expect(follow.errors[:follower_id]).to include('を入力してください')
      end
    end
  end
end
