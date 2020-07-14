module ColumnHeaderHelper
  def arrow(column_name, order_by_column, sort:)
    return if column_name.to_s != order_by_column

    sort == "asc" ? "↑" : "↓"
  end

  def direction(sort)
    sort == "asc" ? "desc" : "asc"
  end
end
