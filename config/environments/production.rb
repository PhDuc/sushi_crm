SushiCrm::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.js_compressor = :uglify
  config.assets.precompile += %w( main/base.js
                                  home.js
                                ) +
                              %w[*.png *.jpg *.jpeg *.gif]
  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Loading the associated records of the objects returned by Model.find using as few queries as possible
  config.eager_load = true

  #### LOGRAGE SETTINGS ####

  # Enable / Disable
  config.lograge.enabled = true

  # Choose formatters:
  # Lograge::Formatters::Lines.new
  # Lograge::Formatters::Cee.new
  # Lograge::Formatters::Graylog2.new
  # Lograge::Formatters::KeyValue.new  # default lograge format
  # Lograge::Formatters::Json.new
  # Lograge::Formatters::Logstash.new
  # Lograge::Formatters::Raw.new       # Returns a ruby hash object
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  # Custom_options for Lograge. Can be a lambda or hash
  # If it's a lambda then it must return a hash
  config.lograge.custom_options = lambda do |event|
    # capture some specific timing values you are interested in

    {:name => "LOGRAGE", :time => event.time, :host => event.payload[:host]}
  end

  # Ignore settings for Lograge
  # config.lograge.ignore_actions = ['home#index', 'aController#anAction']
  # config.lograge.ignore_custom = lambda do |event|
    # return true here if you want to ignore based on the event
  # end

  # If you want to keep original (verbose) Rails.logger
  # Rails 4+
  # config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
  # Rails 3.2
  # config.lograge.logger = ActiveSupport::BufferedLogger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"

  #### END LORAGE SETTINGS ####
end
