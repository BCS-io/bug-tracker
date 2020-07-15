module PaginationHelper
  def prev_page(page)
    page.prev || 1
  end

  def next_page(page)
    page.next || page.last
  end
end
