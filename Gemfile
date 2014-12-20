# A sample Gemfile
source "https://rubygems.org"

gem 'rails', '4.1.1'

gem 'mysql2'

# Uploader
#gem 'carrierwave'              # 画像アップローダ
gem "paperclip"
gem 'mini_magick'              # CarrierWaveでリサイズなどができるようになる

gem 'jquery-rails'

gem 'therubyracer'
gem 'sass-rails', '~> 4.0.0'

# 管理画面
gem "devise"
gem "bcrypt"

# Bootstrap
gem 'bootstrap-sass'#, '3.2.0.2'
gem 'font-awesome-sass'

# gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# gem 'haml-rails'

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
