class Member < ApplicationRecord
  RESIDENCES = %w[
    北海道 青森県 秋田県 岩手県 山形県 宮城県 福島県 新潟県 富山県 石川県 福井県 長野県 群馬県 栃木県
    茨城県 千葉県 埼玉県 東京都 神奈川県 山梨県 静岡県 愛知県 岐阜県 三重県 滋賀県
    京都府 大阪府 奈良県 和歌山県 兵庫県 鳥取県 島根県 岡山県 広島県 山口県 香川県
    徳島県 高知県 愛媛県 福岡県 大分県 宮崎県 熊本県 鹿児島県 佐賀県 長崎県 沖縄県
  ]

  # Include default devise modules. Others available are:
  # :confirmable  :lockable  :timeoutable  :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :favorites, dependent: :destroy

  validate :validate_residence

  def age
  now = Date.current
  now.year- birth_date.year
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |member|
      member.password = SecureRandom.urlsafe_base64
      member.residence = "東京都"
      member.birth_date = Date.today
    end
  end

  private

  # 県名のバリデーション
  def validate_residence
    unless RESIDENCES.include?(residence)
      errors.add(:residence, "不正な県名です")
    end
  end
end
