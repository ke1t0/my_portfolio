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

  # def self.search(search)
  #   if search
  #     User.includes(:posts).where(['name LIKE ? OR body LIKE ?' , "%#{search}%", "%#{search}%"]).references(:posts)
  #   else
  #     all
  #     # nil
  #     # 当てはまらなかったらflash生成とリダイレクト
  #   end
  # end
end
