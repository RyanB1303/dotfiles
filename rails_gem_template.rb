gem_group :development, :test do
  gem 'bullet'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'capybara', '>= 3.26'
  gem 'capybara-select-2'
  gem 'fuubar'
  gem 'selenium-webdriver'
  gem 'show_me_the_cookies'
end

gem_group :development do
  gem 'annotate'
  gem 'any_login'
  gem 'better_errors'
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-passenger', '~> 0.2.0', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4', require: false
  gem 'htmlbeautifier'
  gem 'rubocop-rails', require: false
  gem 'solargraph'
end

gem 'active_link_to'
gem 'devise'
gem 'rolify', '~> 6.0'
gem 'online_migrations'
gem 'rack-cors'
gem 'rails_performance'
gem 'scenic'
