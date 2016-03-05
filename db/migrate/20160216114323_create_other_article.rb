class CreateOtherArticle < ActiveRecord::Migration
  def change
    rename_table :articles, :origin_articles
    add_column :origin_articles, :type, :string, default: "Article"
  end
end
