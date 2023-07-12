class Admin::MembersController < ApplicationController
  def index　#会員の投稿履歴
  end

  def show #会員詳細
    @memeber = Member.find(params[:id])
  end

  def edit #会員編集
    @memeber = Member.find(params[:id])
  end

  def update #会員情報更新
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path
  end

  def destroy #会員の投稿削除
  end
  private
  # ストロングパラメータ
  def member_params
    params.require(:member).permit(:birth_date, :residence,)
  end
end