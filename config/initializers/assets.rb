# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( custom.js )

# Images

Rails.application.config.assets.precompile += %w( avatar-mini.jpg )
Rails.application.config.assets.precompile += %w( avatar-mini2.jpg )
Rails.application.config.assets.precompile += %w( avatar-mini3.jpg )
Rails.application.config.assets.precompile += %w( avatar-mini4.jpg )
Rails.application.config.assets.precompile += %w( avatar1_small.jpg )

# Assets for Main Controller
#Rails.application.config.assets.precompile += %w( main.css )
#Rails.application.config.assets.precompile += %w( main.js )
#Rails.application.config.assets.precompile += %w( bootstrap.css )
#Rails.application.config.assets.precompile += %w( animate.css )
#Rails.application.config.assets.precompile += %w( style.css )
#Rails.application.config.assets.precompile += %w( default.css )
#Rails.application.config.assets.precompile += %w( jquery-1.10.2.js )
#Rails.application.config.assets.precompile += %w( bootstrap.js )
#Rails.application.config.assets.precompile += %w( jquery.easing.min.js )
#Rails.application.config.assets.precompile += %w( jquery.scrollTo.js )
#Rails.application.config.assets.precompile += %w( wow.min.js )
#Rails.application.config.assets.precompile += %w( custom.js )

# Assets for User Controller



#Rails.application.config.assets.precompile += %w( avatar-mini.jpg )
  
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
