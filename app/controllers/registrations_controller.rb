class RegistrationsController < Devise::RegistrationsController

  private
  def after_update_path_for(resource_or_scope)
    dashboard_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def sign_up_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :username, :title, :company, :avatar, :password, :password_confirmation, :current_password)
  end
end
