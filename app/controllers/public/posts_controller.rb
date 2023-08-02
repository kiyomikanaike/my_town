class Public::PostsController < ApplicationController
    before_action :authenticate_member!, except: [:index,:show,:search]
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
      @posts = @prefecture.posts.where(status: "公開").order(created_at: :DESC) #公開内容のみ表示
       if params[:ranking] #人気順表示、お気に入り０は除外
        @posts = @posts.sort{|a,b| b.favorites.count <=> a.favorites.count}.select{|p| p.favorites.count != 0 }
       end
      @title = @prefecture.name
    else
      @posts = Post.all.order(created_at: :DESC)
    end
  end

  def show #投稿詳細
    @post = Post.find(params[:id])
  end


  def search #絞り込み表示
    @posts = Post.where("spot_address LIKE ?", "%#{params[:q]}%").order(created_at: :DESC)

    if params[:q].empty?
      @title = "全国"
    else
      @title = params[:q]  #検索入力した内容
    end

    if @posts.count == 0
      flash.now[:error] = "結果が見つかりません"
    else
      @prefecture = @posts.first.prefecture
    end
    render 'index'
  end

  def edit #投稿編集
    @post = Post.find(params[:id])
  end

  def update #投稿データ更新
    @post = current_member.posts.find(params[:id])
    if @post.update(post_params)
     flash[:success] = "You have updated post successfully."
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy #投稿データ削除
    @post = current_member.posts.find(params[:id])
    @post.destroy
    redirect_to members_my_page_path
  end

  private
  def ensure_member
    @posts = current_member.posts
    @post =@posts.find_by(id: params[:id])
    redirect_to members_my_page_path unless @post
  end

  def post_params
    params.require(:post).permit(:prefecture_id, :spot_name,:spot_postal_code,:spot_address,:point,:status, images: [])
  end
end
