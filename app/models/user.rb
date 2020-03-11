class User < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 },allow_nil: true
  has_secure_password

  mount_uploader :avatar, AvatarUploader

end
