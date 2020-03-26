class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {maximum: 20}
  validates :introduction, length: {maximum: 140}

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :following_relationships

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end
end
