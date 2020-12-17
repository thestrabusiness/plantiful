# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "bcrypt"
gem "bootsnap", ">= 1.4.4", require: false
gem "graphql"
gem "jbuilder", "~> 2.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.0"
gem "sass-rails", ">= 6"
gem "time_for_a_boolean"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
end

group :development do
  gem "annotate"
  gem "graphiql-rails"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
