# frozen_string_literal: true
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-shield'
SimpleCov.formatter = SimpleCov::Formatter::ShieldFormatter
SimpleCov.start
require 'webdrivers'
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each, type: :feature) do
    Capybara.current_session.driver.browser.manage.window.resize_to(2_500, 2_500)
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

Capybara.register_driver(:selenium) do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end
