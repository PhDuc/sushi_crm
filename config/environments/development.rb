SushiCrm::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  # config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # Automatically inject JavaScript needed for LiveReload
  config.middleware.insert_after(ActionDispatch::Static, Rack::LiveReload)

  # Loading the associated records of the objects returned by Model.find using as few queries as possible
  config.eager_load = false

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
