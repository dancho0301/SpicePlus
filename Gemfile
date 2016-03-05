# A sample Gemfile
source "https://rubygems.org"

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.0'   # CSSを効率的に書ける
gem 'haml-rails'               # HTMLを簡潔に書ける
gem 'bootstrap-sass'           # Twitter Bootstrapが使える
gem 'font-awesome-sass'
gem 'uglifier', '>= 1.3.0'     # JavaScriptの圧縮
gem 'coffee-rails', '~> 4.0.0' # JavaScriptを簡潔に書ける
gem 'therubyracer'
gem 'jquery-rails'             # jQueryが使える

# Uploader
gem "paperclip"
gem 'mini_magick'              # CarrierWaveでリサイズなどができるようになる

gem 'active_hash'
gem 'kaminari'                 # ページャ
gem "bitly"                    # url短縮
gem 'rails_autolink'           # URLの自動リンク化
gem 'geocoder'

# エディタに画像アップローダをつける。
# いじりたかったのでプラグインとして持ってきた
# gem 'redactor-paperclip', github: 'DynamoMTL/redactor-paperclip'

# 検索機能
gem 'rails-i18n' # ransackには関係ないけどdate_select用
gem 'ransack'

# 管理画面
gem "sorcery"
# 定数を一元管理する
gem 'config'

gem 'yaml_db'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'erb2haml'
  #gem 'annotate', '2.5.0'      # テーブル情報をモデルファイルに追記してくれる
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rails', '~> 1.0'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'rails-erd'              # モデルのER図をPDFで出力してくれる
  gem 'rails_best_practices'   # Railsのベストプラクティスを教えてくれる
  gem 'bullet'                 # 余計なSQLを検出できる
  gem 'quiet_assets'           # アセットログの抑制

  # gem 'guard'                # ファイルの変更を監視して作業を自動化 ※bundlerを使わないほうがいいためコメントアウト
  # gem 'guard-rspec'          # ファイルが変更されたらRsepcを自動実行
  # gem 'guard-livereload'     # ファイルが変更されたらページを自動リロード

  gem 'better_errors'          # エラー画面を見やすくする
  gem 'binding_of_caller'      # better_errorsのエラー画面でREPLが使える
  gem 'tapp'                   # プリントデバッグがしやすくなる
  gem 'awesome_print'          # プリントデバッグの出力を整形
  gem 'hirb'                   # SQLの結果を見やすく整形してくれる
  gem 'hirb-unicode'           # hirbの日本語対応

  gem 'spring'                 # RspecなどでRailsをプリロードする
end

group :development, :test do
  gem "sqlite3"
  gem "rspec", '~> 3.1.0'      # テストツール
  gem 'rspec-rails'            # RailsでRspecが使える
  gem 'pry-rails'              # railsでpryが使える
  gem 'pry-byebug' # デバッグを実施
  gem 'pry-doc'
  gem 'meta_request'
end

group :test do
  gem "factory_girl_rails"
  # gem 'database_cleaner'       # テスト実行後にDBをクリア
  # gem 'capybara'               # ブラウザでの操作をシミュレートしてテストができる
end

group :production, :staging do
  gem 'mysql2'
end
