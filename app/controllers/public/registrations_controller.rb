class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def after_sign_up_path_for(resource)
    members_my_page_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_date, :residence])
  end
end
