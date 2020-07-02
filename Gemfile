# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bootsnap", ">= 1.4.2", require: false
gem "optimism", "~> 0.3.4"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", github: "rails/rails", branch: "6-0-stable"
gem "sass-rails", ">= 6"
gem "stimulus_reflex", "~> 3.2"
gem "turbolinks", "~> 5"
gem "webpacker", github: "rails/webpacker"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "brakeman"
  gem "factory_bot_rails"
  gem "faker"
  gem "rubocop-minitest"
  gem "rubocop-rails"
  gem "standard"
end

group :development do
  gem "listen", "~> 3.2"
  gem "nested_scaffold"
  gem "seed_dump"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", github: "rails/web-console"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "minitest-reporters"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
