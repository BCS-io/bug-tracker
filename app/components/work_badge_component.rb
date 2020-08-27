class WorkBadgeComponent < ViewComponent::Base
  include ApplicationHelper

  WORK_STATES = {
    'bug':         {image: "bug",            bg_classes: "bg-red-200",    image_classes: "text-gray-800"},
    'improvement': {image: "arrow_bar_up",   bg_classes: "bg-yellow-200", image_classes: "text-gray-800"},
    'task':        {image: "check2_square",  bg_classes: "bg-green-200",  image_classes: "text-gray-800"},
    'new_feature': {image: "plus_circle",    bg_classes: "bg-white",      image_classes: "text-green-600"},
    'epic':        {image: "lightning_fill", bg_classes: "bg-purple-200", image_classes: "text-gray-800"}
  }.freeze

  attr_reader :work
  def initialize(work:)
    @work = work
  end

  def title
    work.titleize
  end

  def image_name
    WORK_STATES.dig(work.to_sym, :image) || "question_octagon"
  end

  def bg_classes
    WORK_STATES.dig(work.to_sym, :bg_classes) || "bg-orange-500"
  end

  def image_classes
    WORK_STATES.dig(work.to_sym, :image_classes) || "text-pink-200"
  end
end
