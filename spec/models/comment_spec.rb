require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) {create(:comment)}

  it "is valid with a text" do
    expect(comment).to be_valid
  end

  context "invalid a text" do
    it "is invalid without a text" do
      comment.text = nil
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
  
    it "too long text" do
      comment.text = "a"*301
      comment.valid?
      expect(comment.errors[:text]).to include("は300文字以内で入力してください")
    end
  end
end
