require "test_helper"
require 'capybara/rails'
require 'capybara/minitest'

class HomeSystemTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  test 'can see the welcome page' do
    sign_in users(:francisco)
    visit root_path
    assert page.has_content? "Home#index"
  end

end
