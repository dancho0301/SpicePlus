class CreateArticleFavorites < ActiveRecord::Migration
  def change
    create_table :article_reputations do |t|
      t.integer :article_id
      t.integer :reputation_genre_id
      t.timestamps
    end
  end
end
