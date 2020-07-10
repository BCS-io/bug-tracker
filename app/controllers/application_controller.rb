class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, unless: :devise_controller?
  before_action :set_action_cable_identifier

  def pundit_user
    current_account
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  private

  def set_action_cable_identifier
    cookies.encrypted[:account_id] = current_account&.id
  end
end
