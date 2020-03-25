class Post < ApplicationRecord
  validates :body, presence: true, length: {maximum: 1000}
  validates :user_id, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      Post.where(['body LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
