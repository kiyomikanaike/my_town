class Public::MembersController < ApplicationController
  REGIDENCE_LIST = ['北海道', '青森県', '秋田県', '岩手県','山形県','宮城県','福島県','新潟県','富山県','石川県','福井県','長野県','群馬県','栃木県',
                  '茨城県','千葉県','埼玉県','東京都','神奈川県','山梨県','静岡県','愛知県','岐阜県','三重県','滋賀県',
                  '京都府','大阪府','奈良県','和歌山県','兵庫県','鳥取県','島根県','岡山県','広島県','山口県','香川県',
                  '徳島県','高知県','愛媛県','福岡県','大分県','宮崎県','熊本県','鹿児島県','佐賀県','長崎県','沖縄県']
  
  before_action :authenticate_member!
  def show #会員マイページ
    @member = current_member
    @posts = @member.posts

    favorites = Favorite.where(member_id: current_member.id).pluck(:post_id)  # ログイン中の会員のお気に入りのpost_idカラムを取得
    @favorite_list = Post.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
    @history_count = 0
    @favorite_count = 0
  end

  def my_posts #ログイン会員の投稿履歴一覧
    @member = current_member
    @posts = @member.posts
  end
  
  def favorite_posts #ログイン会員のお気に入り投稿一覧
    @member = current_member
    @posts = @member.posts
    
    favorites = Favorite.where(member_id: current_member.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def edit #会員情報登録編集
    @member = current_member
    #byebug
  end

  def update #会員情報登録更新
    @member = current_member
    @member.update(member_params)
    redirect_to members_my_page_path
  end

  def confirm_withdraw #会員退会確認
  end

  def withdraw #会員退会処理
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  # ストロングパラメータ
  def member_params
    params.require(:member).permit(:birth_date,:encrypted_password,:residence)
  end

end
