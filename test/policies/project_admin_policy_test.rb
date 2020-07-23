require "test_helper"

class ProjectAdminPolicyTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(role: Account.roles["admin"])
    @project = Project.new(lead: build(:account))
  end

  def test_index
    assert permit @account, @project, :index?
  end

  def test_create
    assert permit @account, @project, :create?
  end

  def test_update
    assert permit @account, @project, :update?
  end

  def test_destroy
    assert permit @account, @project, :destroy?
  end
end
