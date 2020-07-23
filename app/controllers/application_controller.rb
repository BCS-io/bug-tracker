class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_action_cable_identifier

  def pundit_user
    current_account
  end

  private

  def set_action_cable_identifier
    cookies.encrypted[:account_id] = current_account&.id
  end
end
