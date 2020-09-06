class SearchReflex < ApplicationReflex
  delegate :current_account, to: :connection

  def query
    params[:query] = element[:value].strip
  end
end
