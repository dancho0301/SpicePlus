require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
# require "rspec-rails"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpicePlus
  class Application < Rails::Application
    config.generators do |g|
       g.template_engine :haml
    end
    config.sass.preferrd_syntax = :sass
    config.sass.syntax = :sass

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.assets.precompile += ['redactor.js', 'redactor.css']
    config.assets.precompile += %w( maps.js )
    config.assets.precompile += %w( article.js )
    config.assets.precompile += %w( maps.css )
  end
end
