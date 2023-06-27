class Public::SessionsController < Devise::SessionsController
  before_action :member_state, only: [:create]

  protected
  # 退会しているかを判断するメソッド
  def member_state
    # 入力されたメールアドレスからアカウントを1件取得
    @member = Member.find_by(email: params[:member][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@member
    if @member.valid_password?(params[:member][:password])
        if @member.is_deleted
            redirect_to new_member_registration_path
        end
    end
  end
end
