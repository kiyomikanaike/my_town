# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  before_action :member_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  protected
  # 退会しているかを判断するメソッド
  def member_state
  # 入力されたemailからアカウントを1件取得
   @member = Member.find_by(email: params[:member][:email])
  # アカウントを取得できなかった場合、このメソッドを終了する
   return if !@member
   if @member.valid_password?(params[:member][:password])
    if @member.is_deleted
        redirect_to new_member_registration_path
    end
   end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
