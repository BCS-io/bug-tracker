class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    account.role_admin? || owner?
  end

  def destroy?
    account.role_admin? || owner?
  end

  private

  def owner?
    account.id == record.lead_id
  end
end
