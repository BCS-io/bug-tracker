require "test_helper"

class ProjectUserPolicyTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(role: Account.roles["user"])
    @project = Project.new(lead: build(:account))
  end

  def test_index
    assert permit @account, @project, :index?
  end

  def test_create
    assert permit @account, @project, :create?
  end

  def test_update
    assert forbid @account, @project, :update?
  end

  def test_destroy
    assert forbid @account, @project, :destroy?
  end
end
