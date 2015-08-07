# A sample Gemfile
source "https://rubygems.org"

gem 'rails', '4.1.1'
gem 'mysql2'
gem 'active_hash'

# Uploader
#gem 'carrierwave'              # 画像アップローダ
gem "paperclip"
gem 'mini_magick'              # CarrierWaveでリサイズなどができるようになる

# エディタに画像アップローダをつける。
# gem 'redactor-paperclip', github: 'DynamoMTL/redactor-paperclip'

gem 'jquery-rails'

gem 'therubyracer'
gem 'sass-rails', '~> 4.0.0'

# 検索機能
gem 'rails-i18n' # ransackには関係ないけどdate_select用
gem 'ransack'

# 管理画面
# gem "devise"
# gem "bcrypt"
gem "sorcery"

# Bootstrap
gem 'bootstrap-sass'#, '3.2.0.2'
gem 'font-awesome-sass'

# gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'haml-rails'

# url短縮
gem "bitly"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'erb2haml'
  gem 'annotate', '2.5.0'
  gem 'rails-erd'
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rails', '~> 1.0.0'
  gem 'capistrano-bundler', '~> 1.1.2'
end

group :development, :test do
  gem "sqlite3"
  gem "rspec", '~> 3.1.0'
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'transpec'
end

group :test do
end

group :production do

end
