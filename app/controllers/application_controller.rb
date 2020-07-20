class ApplicationController < ActionController::Base
  before_action :set_action_cable_identifier

  private

  def set_action_cable_identifier
    cookies.encrypted[:account_id] = current_account&.id
  end
end
