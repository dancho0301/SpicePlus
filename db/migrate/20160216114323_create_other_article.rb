class CreateOtherArticle < ActiveRecord::Migration
  def change
    rename_table :articles, :origin_articles
    add_column :origin_articles, :type, :string, default: "Article"

    Genre.create id: 0, name: 'お知らせ', css_class: 'other'
  end
end
