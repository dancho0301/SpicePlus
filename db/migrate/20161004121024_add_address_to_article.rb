class AddAddressToArticle < ActiveRecord::Migration
  def change
    add_column :origin_articles, :address, :string
  end
end
