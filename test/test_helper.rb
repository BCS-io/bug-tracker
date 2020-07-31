ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  Capybara.default_max_wait_time = 4

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods

  def permit(current_account, record, action)
    Pundit.authorize(current_account, record, action)
  rescue Pundit::NotAuthorizedError
    false
  end

  def forbid(current_account, record, action)
    !permit(current_account, record, action)
  end
end
