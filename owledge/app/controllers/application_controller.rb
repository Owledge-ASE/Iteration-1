class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :first_name, :last_name, :affiliation, :organization, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :first_name, :last_name, :affiliation, :organization, :password) }
  end
end
