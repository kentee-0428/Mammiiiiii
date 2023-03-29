class Post < ApplicationRecord
  # イメージカラムを指定
  mount_uploader :post_image, ImageUploader

  #アソシエーション設定
  belongs_to :user

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
end
