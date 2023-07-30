class Post < ApplicationRecord
  belongs_to :member, optional: true
  has_many_attached :images
  has_many :favorites, dependent: :destroy #記事が削除されたらお気に入りも削除
  belongs_to :prefecture

  validates :spot_name,presence:true
  validates :images,presence:true
  validates :spot_postal_code,presence:true
  validates :spot_address,presence:true
  validates :point,presence:true

  enum status: { "非公開": 0, "公開": 1 } 



end
