source "http://rubygems.org"

gem "httparty"

group :test do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "simplecov", :require => false
  gem "rspec"
  if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'rb-fsevent'
    gem "growl_notify"
  end
end
