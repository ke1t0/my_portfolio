class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 20}

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
