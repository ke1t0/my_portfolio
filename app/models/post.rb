class Post < ApplicationRecord
  validates :body, presence: true, length: {maximum: 1000}
  validates :user_id, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
end
