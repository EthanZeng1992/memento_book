source 'http://ruby.taobao.org'

ruby "2.1.1"

gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

group :development, :test do
  gem "rspec", "~> 3.0.0.beta2"
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'sqlite3'
end

group :development do
  gem 'guard-rspec', '~> 4.2.8'

  # for guard 
  gem "rb-readline", "~> 0.5.0"

  #--------------------------------------------------------------------------
  gem 'better_errors'         # show errors perfectly
  gem 'binding_of_caller'
  gem 'meta_request'
  #--------------------------------------------------------------------------
end

group :test do
  gem 'shoulda-matchers', :require => false
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'faker'
end

#----------------------------------------------------------------------------
gem 'authlogic', '~> 3.4.1'
gem 'bcrypt-ruby', "~> 3.0.0" #fix authlogic: cannot load such file -- bcrypt
gem 'scrypt', '1.2.1'         #fix authlogic: cannot load such file -- scrypt
#----------------------------------------------------------------------------

gem "haml-rails"

# for heroku
group :production do
  gem 'rails_12factor'
  gem 'pg'
end
