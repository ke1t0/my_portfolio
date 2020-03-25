require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "is valid with a text" do
    comment = FactoryBot.create(:comment)
    expect(comment).to be_valid
  end

  context "invalid a text" do
    it "is invalid without a text" do
      comment = FactoryBot.build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
  
    it "too long text" do
      comment = FactoryBot.build(:comment, text: "a"*301)
      comment.valid?
      expect(comment.errors[:text]).to include("は300文字以内で入力してください")
    end
  end
end
