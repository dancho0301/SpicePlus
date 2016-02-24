class CreateOtherArticleReputations < ActiveRecord::Migration
  def change
    create_table :other_article_reputations do |t|
      t.integer :other_article_id
      t.integer :reputation_genre_id
      t.timestamps
    end
  end
end
