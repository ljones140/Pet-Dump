ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'factory_girl_rails'
require 'capybara/rails'
require 'support/database_cleaner'
require 'support/user_helpers.rb'
require 'capybara/poltergeist'
ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.include UserHelpers
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
