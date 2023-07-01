class Public::MembersController < ApplicationController

  def show #会員マイページ
    @member = current_member
    @posts = @member.posts
    
    favorites = Favorite.where(member_id: current_member.id).pluck(:post_id)  # ログイン中の会員のお気に入りのpost_idカラムを取得
    @favorite_list = Post.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit #会員情報登録編集
    @member = current_member
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
