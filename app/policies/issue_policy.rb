class IssuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    account.role_admin? || owner_issue? || owner_project?
  end

  private

  def owner_issue?
    account.id == record.account_id
  end

  def owner_project?
    account.leads.exists?(record.project_id)
  end
end
