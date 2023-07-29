class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def show #会員詳細
    @member = Member.find(params[:id])
  end

  def edit #会員編集
    @member = Member.find(params[:id])
  end

  def update #会員情報更新
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path
    else
      render :edit
    end
  end
  
  private
  # ストロングパラメータ
  def member_params
    params.require(:member).permit(:birth_date, :residence, :email, :is_deleted)
  end
end