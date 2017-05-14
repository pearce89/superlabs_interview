ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rspec'
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

require 'database_cleaner'
Dir["#{Rails.root}/app/models/**/*.rb"].each do |model|
  load model
end

Rails.application.load_tasks

Capybara.register_driver :selenium_chrome do |app|
 Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :selenium_chrome

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # DatabaseCleaner[:neo4j, connection: {type: :server_db, path: 'http://localhost:7475'}].strategy = :transaction  #for transaction strategy
  #DatabaseCleaner[:neo4j, connection: {type: :server_db, path: 'http://localhost:7475'}].strategy = :deletion     #for deletion strategy

  config.before(:each) do
  end

  config.after(:each) do
    Neo4j::ActiveBase.current_session.query('MATCH (n) DETACH DELETE n')
  end
end