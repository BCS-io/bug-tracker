class TabularReflex < ApplicationReflex
  def order
    session[:order_by] = element.dataset["column-name"]
    session[:direction] = element.dataset["direction"]
  end
end
