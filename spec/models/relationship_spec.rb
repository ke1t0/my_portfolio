require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) {create(:user)}
  let(:other_user) {create(:user)}

  it "is valid" do
    follow = user.follow(other_user)
    
    expect(follow).to be_valid
  end

  it "is invalid without a following_id" do
    f = user.following_relationships.build(following_id: nil)
    f.valid?

    expect(f.errors[:following_id]).to include("を入力してください")
  end
end
