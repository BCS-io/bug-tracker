class PaginateComponent < ViewComponent::Base
  include ApplicationHelper
  attr_reader :pagy, :root

  def initialize(pagy:, root:)
    @pagy = pagy
    @root = root
  end

  def prev_page
    pagy.prev
  end

  def next_page
    pagy.next
  end

  delegate :series, to: :pagy
end
