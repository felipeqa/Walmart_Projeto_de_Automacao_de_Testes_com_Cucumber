require 'rspec'
require 'httparty'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'site_prism'
require 'faker'

include Capybara::DSL

BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")


Capybara.register_driver :selenium do |app|
	if BROWSER.eql?('chrome')
	    Capybara::Selenium::Driver.new(app, :browser => :chrome,
	    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
	      'chromeOptions' => {
	        'args' => [ "--start-maximized" ]
	      }
	    )
	)
	elsif BROWSER.eql?('internet_explorer')
	    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer,
	    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.internet_explorer(
	    'ignoreProtectedModeSettings' => true))

	elsif BROWSER.eql?('firefox')
    	Capybara::Selenium::Driver.new(app, :browser => :firefox)
  	end
end

Capybara.configure do |config|
 Capybara.current_driver = :selenium
 config.default_max_wait_time = 3
end
