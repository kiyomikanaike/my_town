class Post < ApplicationRecord
  belongs_to :member
  has_many_attached :images
end
