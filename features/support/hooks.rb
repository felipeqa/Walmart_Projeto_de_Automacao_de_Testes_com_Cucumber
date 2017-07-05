Before do
	CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")
	Capybara.reset_sessions!
end

After do |scenario|
Dir.mkdir('prints') unless Dir.exist?('prints')

	sufix = ('error' if scenario.failed?) || 'success'
	name = scenario.name.tr(' ', '_').downcase

	page.save_screenshot("prints/#{sufix}-#{name}.png")
	embed("prints/#{sufix}-#{name}.png", 'image/png', 'Screenshot')
end