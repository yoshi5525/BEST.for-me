class Tag < ApplicationRecord
  has_many :contents, through: :content_tags
  has_many :contents_tags
end
