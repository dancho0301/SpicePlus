class AddContainsToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.text :schedule
    end
  end
end
