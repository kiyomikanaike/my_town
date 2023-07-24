class Public::RegistrationsController < Devise::RegistrationsController
  REGIDENCE_LIST = ['北海道', '青森県', '秋田県', '岩手県','山形県','宮城県','福島県','新潟県','富山県','石川県',
                   '福井県','長野県','群馬県','栃木県','茨城県','千葉県','埼玉県','東京都','神奈川県','山梨県','静岡県',
                   '愛知県','岐阜県','三重県','滋賀県','京都府','大阪府','奈良県','和歌山県','兵庫県','鳥取県','島根県',
                   '岡山県','広島県','山口県','香川県','徳島県','高知県','愛媛県','福岡県','大分県','宮崎県','熊本県',
                   '鹿児島県','佐賀県','長崎県','沖縄県']
  before_action :configure_permitted_parameters

  def after_sign_up_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_date, :residence])
  end
end
