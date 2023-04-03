class Comment < ApplicationRecord
  #アソシエーション設定
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
