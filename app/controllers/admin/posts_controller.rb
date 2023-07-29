class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def history #会員の投稿履歴
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def show #投稿詳細
    @post = Post.find(params[:id])
  end

  def destroy #投稿内容削除
  end

  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:prefecture_id, :spot_name,:spot_postal_code,:spot_address,:point,:status, images: [])
  end

end
