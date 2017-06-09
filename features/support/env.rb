require 'rspec'
require 'httparty'
require 'cucumber'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'site_prism'
require 'faker'

include Capybara::DSL

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome, args: ["--start-maximized"])
end

Capybara.configure do |config|
 Capybara.current_driver = :selenium
 config.default_max_wait_time = 3
end
