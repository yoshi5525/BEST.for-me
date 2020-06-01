class Content < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :content_tags, dependent: :destroy
  has_many :tags, through: :content_tags

  validates :product, presence: true
  validates :body, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Content.all unless search
    Content.where('product LIKE(?)', "%#{search}%")
  end
  
end
