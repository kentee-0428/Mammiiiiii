class Post < ApplicationRecord
  # イメージカラムを指定
  mount_uploader :post_image, ImageUploader

  #アソシエーション設定
  belongs_to :user
  has_many :likes, dependent: :destroy

  # 「ログイン中のユーザーがその投稿に対していいねをしているか」
  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
end
