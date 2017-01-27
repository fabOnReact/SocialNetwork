# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Assets for Main Controller
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( default.css )
Rails.application.config.assets.precompile += %w( jquery-1.10.2.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( jquery.easing.min.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.js )
Rails.application.config.assets.precompile += %w( wow.min.js )
Rails.application.config.assets.precompile += %w( custom.js )

# Assets for User Controller

Rails.application.config.assets.precompile += %w( admin.css )

Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-theme.css )
Rails.application.config.assets.precompile += %w( owl.carousel.css )
Rails.application.config.assets.precompile += %w( jquery-jvectormap-1.2.2.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( style-responsive.css )
Rails.application.config.assets.precompile += %w( jquery-ui-1.10.4.min.css )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.css )
Rails.application.config.assets.precompile += %w( wow.min.css )
Rails.application.config.assets.precompile += %w( custom.css )

Rails.application.config.assets.precompile += %w( admin.js )

Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( jquery-ui-1.10.4.min.js )
Rails.application.config.assets.precompile += %w( jquery-1.8.3.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui-1.9.2.custom.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.min.js )
Rails.application.config.assets.precompile += %w( jquery.nicescroll.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( fullcalendar.min.js )
Rails.application.config.assets.precompile += %w( fullcalendar.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.min.js )
Rails.application.config.assets.precompile += %w( calendar-custom.js )
Rails.application.config.assets.precompile += %w( jquery.rateit.min.js )
Rails.application.config.assets.precompile += %w( jquery.customSelect.min.js )
Rails.application.config.assets.precompile += %w( Chart.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo.min.js )
Rails.application.config.assets.precompile += %w( scripts.js )

Rails.application.config.assets.precompile += %w( avatar-mini.jpg )
  
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
