class Post < ApplicationRecord
  belongs_to :member, optional: true
  has_many_attached :images
  has_many :favorites, dependent: :destroy #記事が削除されたらお気に入りも削除
  belongs_to :prefecture

end
