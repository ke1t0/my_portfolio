class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # post_idとuser_idの組みが1組みであるようにするバリデーション
  validates_uniqueness_of :post_id, scope: :user_id
end
