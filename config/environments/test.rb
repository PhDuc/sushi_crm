SushiCrm::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Configure static asset server for tests with Cache-Control for performance
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"

  # Log error messages when you accidentally call methods on nil
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Raise exception on mass assignment protection for Active Record models
  # config.active_record.mass_assignment_sanitizer = :strict

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

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
