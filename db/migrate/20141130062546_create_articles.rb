class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :article
      t.integer :member_id

      t.timestamps
    end
  end
end
