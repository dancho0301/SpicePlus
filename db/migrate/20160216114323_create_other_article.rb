class CreateOtherArticle < ActiveRecord::Migration
  def change
    create_table :other_articles do |t|
      t.string      :title
      t.date        :publication_date
      t.string      :description
      t.text        :article
      t.attachment  :photo
      t.boolean     :publication, :default => false
      t.timestamps
    end
  end
end
