# Load the Rails application.
require File.expand_path('../application', __FILE__)

app_config=YAML.load_file('config/config.yml')[Rails.env].with_indifferent_access
local_config_file = File.expand_path('../config_local.yml',__FILE__)
local_app_config = {}
if File.exist?(local_config_file)
  local_app_config=YAML.load_file(local_config_file)
end
APP_CONFIG = app_config.deep_merge(local_app_config)

# Initialize the Rails application.
Rails.application.initialize!
