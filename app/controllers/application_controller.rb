# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(user)
    flash[:notice] = "Hello, #{user.firstname} #{user.lastname}!"
    user.is_a?(Admin) ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :login, :email, :password) }
  end
end
