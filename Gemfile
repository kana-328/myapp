source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.1'
gem 'bootstrap-honoka-rails' , '~> 4.3.1'
gem 'jquery-rails'
gem 'rails-controller-testing'
gem 'faker'
gem 'kaminari'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'gon',  '~> 6.2.0'
gem 'carrierwave',             '1.1.0'
gem "mini_magick", ">= 4.9.4"
gem 'fog-aws'
gem 'ransack'
gem 'bullet'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rubocop-airbnb'
  gem 'webdrivers'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara', '~> 2.15.2'
  gem 'launchy', '~>2.4.3'
end

group :production, :staging do
  gem 'unicorn'
  gem 'mini_racer'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
