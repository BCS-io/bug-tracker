require "test_helper"

module FactoryBots
  class AccountTest < ActiveSupport::TestCase
    test "has a valid default factory" do
      account = build(:account)

      assert account.valid?
    end

    test "has a valid admin_account factory" do
      account = build(:admin_account)

      assert account.valid?
    end
  end
end
