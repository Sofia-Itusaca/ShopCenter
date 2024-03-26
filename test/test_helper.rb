ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  
  def login
    post sessions_path, params: {login: 'admin@shopcenter.com',password: 'admin*'}
  end

  def login_user
    post sessions_path, params: {login: 'prueba@shopcenter.com',password: 'prueva*'}
  end
end
