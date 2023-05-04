class Post < ApplicationRecord
  # イメージカラムを指定
  has_one_attached :post_image

  #アソシエーション設定
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 「ログイン中のユーザーがその投稿に対していいねをしているか」
  # def liked?(user)
  #   likes.where(user_id: user.id).present?
  # end
  def liked?(like, current_user_id)
    like.pluck(:user_id).include?(current_user_id)
  end

  # ransackモデルにホワイトリストを登録
  def self.ransackable_attributes(auth_object = nil)
    ["content"]
  end

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
end
