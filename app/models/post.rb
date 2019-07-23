class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  validates :title, presence: true, length: {maximum: 25}
  validates :content, presence: true, length: {maximum: 255}
end
