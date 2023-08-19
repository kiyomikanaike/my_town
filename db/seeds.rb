p "データを作成します"

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
kanto.prefectures.find_or_create_by!(name: "茨城県")
kanto.prefectures.find_or_create_by!(name: "栃木県")
kanto.prefectures.find_or_create_by!(name: "群馬県")
kanto.prefectures.find_or_create_by!(name: "埼玉県")
kanto.prefectures.find_or_create_by!(name: "千葉県")
kanto.prefectures.find_or_create_by!(name: "東京都")
kanto.prefectures.find_or_create_by!(name: "神奈川県")
chubu.prefectures.find_or_create_by!(name: "新潟県")
chubu.prefectures.find_or_create_by!(name: "富山県")
chubu.prefectures.find_or_create_by!(name: "石川県")
chubu.prefectures.find_or_create_by!(name: "福井県")
chubu.prefectures.find_or_create_by!(name: "山梨県")
chubu.prefectures.find_or_create_by!(name: "長野県")
chubu.prefectures.find_or_create_by!(name: "岐阜県")
chubu.prefectures.find_or_create_by!(name: "静岡県")
chubu.prefectures.find_or_create_by!(name: "愛知県")
kinki.prefectures.find_or_create_by!(name: "三重県")
kinki.prefectures.find_or_create_by!(name: "滋賀県")
kinki.prefectures.find_or_create_by!(name: "京都府")
kinki.prefectures.find_or_create_by!(name: "大阪府")
kinki.prefectures.find_or_create_by!(name: "兵庫県")
kinki.prefectures.find_or_create_by!(name: "奈良県")
kinki.prefectures.find_or_create_by!(name: "和歌山県")
chugoku.prefectures.find_or_create_by!(name: "鳥取県")
shimane = chugoku.prefectures.find_or_create_by!(name: "島根県")
okayama = chugoku.prefectures.find_or_create_by!(name: "岡山県")
chugoku.prefectures.find_or_create_by!(name: "広島県")
chugoku.prefectures.find_or_create_by!(name: "山口県")
shikoku.prefectures.find_or_create_by!(name: "徳島県")
shikoku.prefectures.find_or_create_by!(name: "香川県")
shikoku.prefectures.find_or_create_by!(name: "愛媛県")
shikoku.prefectures.find_or_create_by!(name: "高知県")
kyushu.prefectures.find_or_create_by!(name: "福岡県")
kyushu.prefectures.find_or_create_by!(name: "佐賀県")
kyushu.prefectures.find_or_create_by!(name: "長崎県")
kyushu.prefectures.find_or_create_by!(name: "熊本県")
kyushu.prefectures.find_or_create_by!(name: "大分県")
kyushu.prefectures.find_or_create_by!(name: "宮崎県")
kyushu.prefectures.find_or_create_by!(name: "鹿児島県")
kyushu.prefectures.find_or_create_by!(name: "沖縄県")



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

p "データの作成に成功しました!"
