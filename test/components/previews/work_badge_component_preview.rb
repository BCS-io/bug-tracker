class WorkBadgeComponentPreview < ViewComponent::Preview
  def with_bug
    render(WorkBadgeComponent.new(work: "bug"))
  end

  def with_improvement
    render(WorkBadgeComponent.new(work: "improvement"))
  end

  def with_task
    render(WorkBadgeComponent.new(work: "task"))
  end

  def with_new_feature
    render(WorkBadgeComponent.new(work: "new_feature"))
  end

  def with_epic
    render(WorkBadgeComponent.new(work: "epic"))
  end

  def with_missing_state
    render(WorkBadgeComponent.new(work: "missing"))
  end
end
