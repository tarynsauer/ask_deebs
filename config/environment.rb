# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
AskDeebs::Application.initialize!

env_config = YAML.load_file(APP_ROOT.join('config', 'auth.yaml'))

env_config.each do |key, value|
  ENV[key] = value
end

# ENV['OAUTH_TOKEN'] = # your token
# ENV['OAUTH_SECRET'] = # your secret
# ENV['OAUTH_REDIRECT'] = # your redirect url
