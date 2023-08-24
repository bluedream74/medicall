source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "jbuilder"
gem "redis", "~> 4.0"
gem "ridgepole"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "letter_opener_web", "~> 2.0"
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "web-console"
  # gem "rack-mini-profiler"
  # gem "spring"
end

gem "ancestry"
gem "bitmask_attributes", "~> 1.0"
gem "devise"
gem "dotenv-rails"
gem "enum_help"
gem "hotwire-rails", "~> 0.1.3"
gem "i18n"
gem "inline_svg"
gem "twilio-ruby", "~> 6.3.0"
