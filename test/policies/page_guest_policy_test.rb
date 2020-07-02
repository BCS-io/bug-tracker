require "test_helper"

class PageGuestPolicyTest < ActiveSupport::TestCase
  def test_home
    assert permit nil, :pages, :home?
  end
end
