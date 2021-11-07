class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_one_attached :image
  has_many_attached :images
  validates :category_id, presence: true
end
