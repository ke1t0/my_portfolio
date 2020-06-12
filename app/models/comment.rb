# コメント機能モデル ユーザーと投稿に紐付け
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true, length: {maximum: 300}
end
