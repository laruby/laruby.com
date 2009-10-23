### Be sure to restart your server when you modify this file.

##
# Specifies gem version of Rails to use when vendor/rails is not present.
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

##
# Bootstrap the Rails environment, frameworks, and default configuration.
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  ##
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  ##
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "haml", :version => "2.2.3"
  config.gem "BRIMIL01-meetup_api", :lib => 'meetup_api', :source => 'http://gems.github.com/'
  config.gem "json", :version => ">=1.1.0"
  config.gem "binarylogic-authlogic", :lib => 'authlogic', :source => 'http://gems.github.com/'
  config.gem "twitter"
  config.gem "mechanize"

  ##
  # Development gems.
  if %(development test cucumber).include? RAILS_ENV
    config.gem "webrat", :version => "0.5.3"
    config.gem "rspec", :lib => false, :version => "1.2.8"
    config.gem "rspec-rails", :lib => false, :version => "1.2.7.1"
    config.gem "cucumber", :version => "~>0.4.2"
  end

  if RUBY_VERSION == "1.8.7"
    config.gem "openrain-action_mailer_tls", :lib => "smtp_tls", :source => "http://gems.github.com"
  end

  ##
  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  ##
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'
end
