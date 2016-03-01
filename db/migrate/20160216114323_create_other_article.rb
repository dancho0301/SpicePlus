class CreateOtherArticle < ActiveRecord::Migration
  def change
    rename_table :articles, :origin_articles
    add_column :origin_articles, :type, :string, default: "Article"

    Genre.create do |g|
      g.id = 0
      g.name = 'お知らせ'
      g.css_class = 'other'
    end
  end
end
