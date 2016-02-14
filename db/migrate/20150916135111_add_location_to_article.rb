class AddLocationToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :latitude,  :decimal, precision: 9, scale: 6
    add_column :articles, :longitude, :decimal, precision: 9, scale: 6
  end
end
