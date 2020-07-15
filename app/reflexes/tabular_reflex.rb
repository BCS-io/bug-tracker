class TabularReflex < ApplicationReflex
  delegate :current_account, to: :connection

  def order
    session[:order_by] = element.dataset["column-name"]
    session[:direction] = element.dataset["direction"]
  end

  def paginate
    session[:page] = element.dataset[:page].to_i
  end
end
