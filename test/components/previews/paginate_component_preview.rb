Pagination = Struct.new(:series, :prev, :next)

class PaginateComponentPreview < ViewComponent::Preview
  def page_1_of_three
    double = Pagination.new(["1", 2, 3], nil, 2)
    render(PaginateComponent.new(pagy: double))
  end

  def page_2_of_three
    double = Pagination.new([1, "2", 3], 1, 3)
    render(PaginateComponent.new(pagy: double))
  end

  def page_3_of_three
    double = Pagination.new([1, 2, "3"], 2, nil)
    render(PaginateComponent.new(pagy: double))
  end
end
