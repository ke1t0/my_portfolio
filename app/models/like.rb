# いいね機能モデル ユーザーと投稿に紐付け
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :user_id
end
