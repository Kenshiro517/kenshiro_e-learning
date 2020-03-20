class Category < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length:{ maximum: 100}
  has_many :words, dependent: :destroy
end
