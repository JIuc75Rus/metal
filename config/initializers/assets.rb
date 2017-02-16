# Be sure to restart your server when you modify this file.
Rails.application.config.assets.precompile += %w( jquery-1.5.1.min.js )
Rails.application.config.assets.precompile += %w( jquery.orbit-1.2.3.js )
Rails.application.config.assets.precompile += %w( mail.js )
Rails.application.config.assets.precompile += %w( tinymce-jquery.js )
Rails.application.config.assets.precompile += %w( tinymce.js )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( admin.js )
Rails.application.config.assets.precompile += %w( simple.css )
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )