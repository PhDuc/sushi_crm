source 'https://rubygems.org'
ruby "2.1.5"
gem 'rails', '~> 4.1.8'                      # Core rails gem

gem "awesome_print"                          # Pretty print result
gem 'autoprefixer-rails'                     # Auto add browser vendor prefixes
gem 'bootstrap-sass'                         # Bootstrap sass port to rails
gem 'coffee-rails', '~> 4.1.0'               # Coffeescript
gem "haml"                                   # Better HTML
gem "mysql2"                                 # Database (sql)
gem 'pg'                                     # Database (postgresql)
gem 'jquery-rails'                           # JQuery with rails
gem 'sass-rails', '~> 4.0.4'                 # CSS extension
gem 'uglifier', '>= 1.0.3'                   # JavaScript interpreter
gem "i18n-js", ">= 3.0.0.rc8"                # Javascript internationalization
gem "font-awesome-rails"                     # Awesome icon fonts
gem 'newrelic_rpm'                           # NewRelic tracking
gem 'noty-rails'                             # Awesome notification gem
gem "lograge"                                # Cleaner logging
gem "logstash-event"                         # Format log output
gem 'foreigner'                              # Allow add_foreign_key
gem 'twilio-ruby'                            # Twilio of awesomeness

group :production do
  gem 'rails_12factor'                       # Required for heroku Rails 4 ('rails_serve_static_assets')
end

group :test, :development, :qa do
  gem "pry-byebug"                           # Binding pry debugger
  gem "pry-rails"                            # Binding pry debugger
  gem "pry-remote"                           # Remote pry debugger
  gem "rspec-rails", ">= 3.1.0"              # Test rspec
  gem 'guard', '>= 2.2.2', require: false    # Guard
  gem 'guard-livereload',  require: false    # Guard + livereload
  gem 'rack-livereload'                      # Guard + livereload
  gem 'rb-fsevent',        require: false    # Guard + livereload
  #gem 'guard-coffeescript'                  # Guard + Coffeescript. Not working for some reason
end

