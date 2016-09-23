source 'https://rubygems.org'
ruby "2.3.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
gem 'mysql2', '~> 0.3.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

#Heroku Deploy
gem 'rails_12factor', group: :production
gem 'passenger'

#### SoulMedicine specific gems ####
gem 'dotenv-rails', :groups => [:development, :test]
gem 'twilio-ruby'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'sprockets_better_errors'
gem 'devise'
gem 'cancancan', '~> 1.10'
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_theme'
gem 'sidekiq'
gem 'sinatra', :require => false
#### End of SoulMedicine specific gems ####



# Security
gem 'bcrypt', '~> 3.1.7'
gem 'econfig', require: 'econfig/rails'

# Development

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
