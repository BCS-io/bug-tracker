require "test_helper"

module Accounts
  class ValidatesTest < ActiveSupport::TestCase
    def setup
      @account = Account.new
    end

    test "validates username presence" do
      @account.valid?

      assert @account.errors.added?(:username, :blank)
    end

    test "validates username uniqueness" do
      create(:account, username: "common")

      duplicate_username = build(:account, username: "common")

      duplicate_username.valid?

      assert duplicate_username.errors.added?(:username, :taken, value: "common")
    end
  end
end
