Admin.find_or_create_by!(email: "kiyo@gmail.com") do |admin|
  admin.password = "e123456"
end

hokkaido_chiho = Region.find_or_create_by!(name: "北海道")
tohoku = Region.find_or_create_by!(name: "東北")
kanto = Region.find_or_create_by!(name: "関東")
chubu = Region.find_or_create_by!(name: "中部")
kinki = Region.find_or_create_by!(name: "近畿")
chugoku = Region.find_or_create_by!(name: "中国")
shikoku = Region.find_or_create_by!(name: "四国")
kyushu = Region.find_or_create_by!(name: "九州")

hokkaido = hokkaido_chiho.prefectures.find_or_create_by!(name: "北海道")
tohoku.prefectures.find_or_create_by!(name: "青森県")
tohoku.prefectures.find_or_create_by!(name: "岩手県")
tohoku.prefectures.find_or_create_by!(name: "宮城県")
tohoku.prefectures.find_or_create_by!(name: "秋田県")
tohoku.prefectures.find_or_create_by!(name: "山形県")
tohoku.prefectures.find_or_create_by!(name: "福島県")

shimane = chugoku.prefectures.find_or_create_by!(name: "島根県")
okayama = chugoku.prefectures.find_or_create_by!(name: "岡山県")

# prefectures = Prefecture.create!([
#   { region_id: 1, name: "北海道" },
#   { region_id: 2, name: "青森県" },
#   { region_id: 2, name: "岩手県" },
#   { region_id: 2, name: "宮城県" },
#   { region_id: 2, name: "秋田県" },
#   { region_id: 2, name: "山形県" },
#   { region_id: 2, name: "福島県" },
#   { region_id: 3, name: "茨城県" },
#   { region_id: 3, name: "栃木県" },
#   { region_id: 3, name: "群馬県" },
#   { region_id: 3, name: "埼玉県" },
#   { region_id: 3, name: "千葉県" },
#   { region_id: 3, name: "東京都" },
#   { region_id: 3, name: "神奈川県" },
#   { region_id: 4, name: "新潟県" },
#   { region_id: 4, name: "富山県" },
#   { region_id: 4, name: "石川県" },
#   { region_id: 4, name: "福井県" },
#   { region_id: 4, name: "山梨県" },
#   { region_id: 4, name: "長野県" },
#   { region_id: 4, name: "岐阜県" },
#   { region_id: 4, name: "静岡県" },
#   { region_id: 4, name: "愛知県" },
#   { region_id: 5, name: "三重県" },
#   { region_id: 5, name: "滋賀県" },
#   { region_id: 5, name: "京都府" },
#   { region_id: 5, name: "大阪府" },
#   { region_id: 5, name: "兵庫県" },
#   { region_id: 5, name: "奈良県" },
#   { region_id: 5, name: "和歌山県" },
#   { region_id: 6, name: "鳥取県" },
#   { region_id: 6, name: "島根県" },
#   { region_id: 6, name: "岡山県" },
#   { region_id: 6, name: "広島県" },
#   { region_id: 6, name: "山口県" },
#   { region_id: 7, name: "徳島県" },
#   { region_id: 7, name: "香川県" },
#   { region_id: 7, name: "愛媛県" },
#   { region_id: 7, name: "高知県" },
#   { region_id: 8, name: "福岡県" },
#   { region_id: 8, name: "佐賀県" },
#   { region_id: 8, name: "長崎県" },
#   { region_id: 8, name: "熊本県" },
#   { region_id: 8, name: "大分県" },
#   { region_id: 8, name: "宮崎県" },
#   { region_id: 8, name: "鹿児島県" },
#   { region_id: 8, name: "沖縄県" }
# ])

member1 = Member.find_or_create_by!(email: "shimane@example.com") do |member|
  member.birth_date = Time.parse("1960/01/01")
  member.password = "password"
  member.residence = "島根県"
end

member2 = Member.find_or_create_by!(email: "hokkaido@example.com") do |member|
  member.birth_date = Time.parse("1985/01/01")
  member.password = "password"
  member.residence = "北海道"
end

member3 = Member.find_or_create_by!(email: "okayama@example.com") do |member|
  member.birth_date = Time.parse("1993/01/01")
  member.password = "password"
  member.residence = "岡山県"
end

member1.posts.find_or_create_by!(spot_name: "宍道湖") do |post|
  post.status = "公開"
  post.images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename: "sample-post1.jpg")
  post.spot_postal_code = "699-1234"
  post.spot_address = "島根県松江市1-1"
  post.point = "夕日の景色がとても素敵です。"
  post.prefecture = shimane
end

member2.posts.find_or_create_by!(spot_name: "青い池") do |post|
  post.status = "公開"
  post.images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename: "sample-post2.jpg")
  post.spot_postal_code = "299-1234"
  post.spot_address = "北海道札幌市1-1"
  post.point = "綺麗な青色と澄んだ空気が最高です。"
  post.prefecture = hokkaido
end

member3.posts.find_or_create_by!(spot_name: "牛窓テレモーク") do |post|
  post.status = "公開"
  post.images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename: "sample-post3.jpg")
  post.spot_postal_code = "399-1234"
  post.spot_address = "岡山県瀬戸内市1-1"
  post.point = "アートやカフェを楽しめます。"
  post.prefecture = okayama
end
