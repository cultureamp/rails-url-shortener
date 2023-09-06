source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Only include the pieces of Rails that we're using
# -- Begin rails
# gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'actionpack', '~> 6.1.3', '>= 6.1.4.6'
gem 'activemodel', '~> 6.1.3', '>= 6.1.4.6'
gem 'activerecord', '~> 6.1.3', '>= 6.1.4.6'
gem 'activesupport', '~> 6.1.3', '>= 6.1.4.6'
gem 'bundler', '>= 2.4.19'
gem 'railties', '~> 6.1.3', '>= 6.1.4.6'
# -- End rails

gem 'annotate', require: false
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'jwt'
gem 'pg', '~> 1.5'
gem 'puma', '~> 6.3'

group :development, :test do
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
