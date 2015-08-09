class AddArticlePublication < ActiveRecord::Migration
  def change
    add_column :articles, :publication, :boolean, :default => false
  end
end
