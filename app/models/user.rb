class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :posts
  has_secure_password
  before_validation {email.downcase!}

  validates :name, presence: true, length: {maximum: 25}
  validates :email, presence: true, length: { maximum: 255 },uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
