class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  
  def age
  now = Time.zone.now
  now.year - birth_date.year - (birth_date.to_date.change(year: now.year) > now ? 1 : 0)
  end

end
