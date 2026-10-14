source "https://rubygems.org"

ruby "~> 3.4.4"

gem "rails", "~> 8.0"
gem "puma"
gem "bcrypt"
gem "bootsnap", require: false

gem "sprockets-rails"
gem "sassc-rails"
gem "bootstrap-sass", "~> 3.4.1"
gem "jquery-rails"
gem "turbo-rails"
gem "jbuilder"

gem "faker"
gem "will_paginate", "~> 3.3"
gem "bootstrap-will_paginate"
gem "carrierwave"
gem "mini_magick"

gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "sqlite3", "~> 2.9.6"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
  gem "bundler-audit", require: false
end

group :test do
  gem "rails-controller-testing"
  gem "minitest-reporters"
end

group :production do
  gem "pg"
  gem "fog-aws"
end
