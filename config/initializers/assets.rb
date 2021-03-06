# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( events.css )
Rails.application.config.assets.precompile += %w( show.css )
Rails.application.config.assets.precompile += %w( new.css )
Rails.application.config.assets.precompile += %w( edit.css )
Rails.application.config.assets.precompile += %w( form.css )
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( signup.css )
Rails.application.config.assets.precompile += %w( resetpass.css )
Rails.application.config.assets.precompile += %w( landing.css )
Rails.application.config.assets.precompile += %w( other_links.css )
Rails.application.config.assets.precompile += %w( jquery.js )