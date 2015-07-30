class CreateInitialMigrate < ActiveRecord::Migration
  def change
    # 団体情報
    create_table :groups do |t|
      t.string :name
      t.string :master_name
      t.string :address
      t.string :tel
      t.string :url
      t.string :mail
      t.text :activity
      t.text :detail
      t.timestamps
    end

    # メンバー
    create_table :members do |t|
      t.string :name
      t.string :mail
      t.timestamps
    end

    # 記事
    create_table :articles do |t|
      t.string     :title
      t.date       :publication_date
      t.string     :description
      t.text       :article
      t.attachment :photo
      t.integer    :genre_id
      t.integer    :area_id
      t.integer    :group_id
      t.integer    :spice_id
      t.timestamps
    end

    # おすすめポイント
    create_table :article_recommends do |t|
      t.integer :article_id
      t.string  :description
    end

    # 参加プラン
    create_table :article_plans do |t|
      t.integer    :article_id
      t.string     :title
      t.text       :description
      t.string     :color_theme
      t.timestamps
    end

    # スケジュール
    create_table :article_schedules do |t|
      t.integer    :article_id
      t.string     :time
      t.string     :title
      t.string     :description
      t.timestamps
    end

    # 体験レポート
    create_table :reports do |t|
      t.integer    :article_id
      t.string     :name
      t.string     :title
      t.date       :report_date
      t.text       :report_body
      t.attachment :photo
      t.string     :point
      t.integer    :main_reporter
      t.string     :signature
      t.integer    :spice_id
      t.timestamps
    end

    # 記事の画像
    create_table :article_images do |t|
      t.string :title
      t.string :description
      t.attachment :image
      t.timestamps
    end

    # ジャンル
    create_table :genres do |t|
      t.string :name
      t.string :css_class
      t.timestamps
    end

    # スパイス
    create_table :spices do |t|
      t.string :name
      t.string :css_class
      t.timestamps
    end

    # 路線
    create_table :lines do |t|
      t.string :name
      t.timestamps
    end

    # 地域
    create_table :areas do |t|
      t.string :name
    end

    # 記事と路線の関連付け
    create_table :article_lines do |t|
      t.integer :article_id
      t.integer :line_id
      t.timestamps
    end

    # 参加エントリー
    create_table :entry do |t|
      t.string :name
      t.string :mail
      t.string :tel
      t.text   :comment
      t.integer :article_id
      t.timestamps
    end

    # お問い合わせ
    create_table :inquiries do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :message
      t.integer :article_id
    end
  end
end
