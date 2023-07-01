class Public::PostsController < ApplicationController
  def new #新規投稿画面
    @post = Post.new
  end

  def create#新規投稿
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      # 保存が成功した場合の処理
      redirect_to members_my_page_path
    else
      # 保存が失敗した場合の処理
      render :new
    end
  end

  def index #投稿一覧
    if params[:prefecture_id]
      @prefecture = Prefecture.find(params[:prefecture_id])
      @posts = @prefecture.posts
    else
      @posts = Post.all#各都道府県に投稿された内容全てとしたい
    end
  end

  def show #投稿詳細
    @post = Post.find(params[:id])
  end

  def edit #投稿編集
  end

  def update #投稿データ更新
  end

  def destroy #投稿データ削除
  end

  private

  def post_params
    params.require(:post).permit(:prefecture_id, :spot_name,:spot_postal_code,:spot_address,:point, images: [])
  end
end
