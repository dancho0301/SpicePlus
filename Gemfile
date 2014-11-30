# A sample Gemfile
source "https://rubygems.org"

gem 'rails', '4.1.1'

gem 'mysql2'

# Uploader
gem 'carrierwave'              # 画像アップローダ
gem 'mini_magick'              # CarrierWaveでリサイズなどができるようになる

gem "twitter-bootstrap-rails", "~> 2.2.8"
gem 'bootstrap-sass', '2.3.2.0'
gem "font-awesome-rails"
gem 'jquery-rails'
gem 'summernote-rails'

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails', '~> 4.0.0'
  gem 'haml-rails'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'erb2haml'
  gem 'annotate', '2.5.0'
end

group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
  gem 'pry-rails'
  gem 'pry-doc'
end

group :test do
end

group :production do

end