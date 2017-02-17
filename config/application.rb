require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Metal22Ru
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.serve_static_assets = true
    config.action_dispatch.x_sendfile_header = nil
    config.i18n.default_locale = :ru
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.to_prepare do
      Devise::SessionsController.layout "login"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "devise" }
      Devise::ConfirmationsController.layout "devise"
      Devise::UnlocksController.layout "devise"
      Devise::PasswordsController.layout "devise"
    end
  end
end
