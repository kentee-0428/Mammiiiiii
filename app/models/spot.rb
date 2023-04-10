class Spot < ApplicationRecord
  # イメージカラムを指定
  mount_uploader :spot_image, ImageUploader

  #アソシエーション設定
  belongs_to :user
  has_many :spot_category_relations
  has_many :categories, through: :spot_category_relations

  validates :title, presence: true, length: { maximum: 15 }
  validates :address, presence: true
  validates :spot_image, presence: true
  validates :content, length: { maximum: 150 }
  validates :user_id, presence: true
end
