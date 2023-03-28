class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # イメージカラムを指定
  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :gender, presence: true, on: :update
  validates :introduction, length: { maximum: 150 }
end
