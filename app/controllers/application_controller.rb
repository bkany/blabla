class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation, :current_password)}
  end
  def remove
    @user = User.find(params[:user_id])
    @avatar = @user.avatar
    @avatar.purge
    redirect_to root_path, notice: "delete was successfully removed."
  end
end
