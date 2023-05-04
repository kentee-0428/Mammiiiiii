class Spot < ApplicationRecord
  # イメージカラムを指定
  has_one_attached :spot_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #アソシエーション設定
  belongs_to :user
  has_many :spot_category_relations
  has_many :categories, through: :spot_category_relations

  # ransackモデルにホワイトリストを登録
  def self.ransackable_attributes(auth_object = nil)
    ["address"]
  end

  validates :title, presence: true, length: { maximum: 15 }
  validates :address, presence: true
  validates :spot_image, presence: true
  validates :content, length: { maximum: 150 }
  validates :user_id, presence: true
end
