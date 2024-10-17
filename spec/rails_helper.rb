# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'faker'
require 'shoulda/matchers'
require 'selenium-webdriver'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
Capybara.server_host = '0.0.0.0'
Capybara.server_port = 3000
Capybara.app_host = "http://172.18.0.3:3000"
Capybara.register_driver :selenium_remote_headless do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument("--headless")
  options.add_argument('--no-sandbox')

  Capybara::Selenium::Driver.new(app, browser: :remote, url: "http://selenium:4444/wd/hub", options: options)
end
Capybara.default_driver = :selenium_remote_headless
Capybara.javascript_driver = :selenium_remote_headless


RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

