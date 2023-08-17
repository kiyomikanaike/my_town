Region.create!([
  { id: 1, name: '北海道' },
  { id: 2, name: '東北' },
  { id: 3, name: '関東' },
  { id: 4, name: '中部' },
  { id: 5, name: '近畿' },
  { id: 6, name: '中国' },
  { id: 7, name: '四国' },
  { id: 8, name: '九州' },
])

prefectures = Prefecture.create!([
  { region_id: 1, name: '北海道' },
  { region_id: 2, name: '青森県' },
  { region_id: 2, name: '岩手県' },
  { region_id: 2, name: '宮城県' },
  { region_id: 2, name: '秋田県' },
  { region_id: 2, name: '山形県' },
  { region_id: 2, name: '福島県' },
  { region_id: 3, name: '茨城県' },
  { region_id: 3, name: '栃木県' },
  { region_id: 3, name: '群馬県' },
  { region_id: 3, name: '埼玉県' },
  { region_id: 3, name: '千葉県' },
  { region_id: 3, name: '東京都' },
  { region_id: 3, name: '神奈川県' },
  { region_id: 4, name: '新潟県' },
  { region_id: 4, name: '富山県' },
  { region_id: 4, name: '石川県' },
  { region_id: 4, name: '福井県' },
  { region_id: 4, name: '山梨県' },
  { region_id: 4, name: '長野県' },
  { region_id: 4, name: '岐阜県' },
  { region_id: 4, name: '静岡県' },
  { region_id: 4, name: '愛知県' },
  { region_id: 5, name: '三重県' },
  { region_id: 5, name: '滋賀県' },
  { region_id: 5, name: '京都府' },
  { region_id: 5, name: '大阪府' },
  { region_id: 5, name: '兵庫県' },
  { region_id: 5, name: '奈良県' },
  { region_id: 5, name: '和歌山県' },
  { region_id: 6, name: '鳥取県' },
  { region_id: 6, name: '島根県' },
  { region_id: 6, name: '岡山県' },
  { region_id: 6, name: '広島県' },
  { region_id: 6, name: '山口県' },
  { region_id: 7, name: '徳島県' },
  { region_id: 7, name: '香川県' },
  { region_id: 7, name: '愛媛県' },
  { region_id: 7, name: '高知県' },
  { region_id: 8, name: '福岡県' },
  { region_id: 8, name: '佐賀県' },
  { region_id: 8, name: '長崎県' },
  { region_id: 8, name: '熊本県' },
  { region_id: 8, name: '大分県' },
  { region_id: 8, name: '宮崎県' },
  { region_id: 8, name: '鹿児島県' },
  { region_id: 8, name: '沖縄県' }
])

Admin.create!(
  email:"kiyo@gmail.com",
  password:"e123456"
  )

members = Member.create!(
  [
    {email: 'shimane@example.com', birth_date: Time.parse("1960/01/01"), password: 'password',residence: '島根県' },
    {email: 'hokkaido@example.com', birth_date: Time.parse("1985/01/01"), password: 'password',residence: '北海道'},
    {email: 'okayama@example.com', birth_date: Time.parse("1993/01/01"), password: 'password',residence: '岡山県'}
  ]
)

posts = Post.create!(
  [
    {spot_name: '宍道湖', status: 1 , images: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), spot_postal_code: '699-1234', spot_address: '島根県松江市1-1', point: '夕日の景色がとても素敵です。',  member_id: members[0].id, prefecture_id: prefectures[31].id },
    {spot_name: '青い池', status: 1, images: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), spot_postal_code: '299-1234', spot_address: '北海道札幌市1-1', point: '綺麗な青色と澄んだ空気が最高です。',  member_id: members[1].id, prefecture_id: prefectures[0].id },
    {spot_name: '牛窓テレモーク', status: 1,images: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), spot_postal_code: '399-1234', spot_address: '岡山県瀬戸内市1-1', point: 'アートやカフェを楽しめます。',  member_id: members[2].id, prefecture_id: prefectures[32].id}
    ]
  )
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
