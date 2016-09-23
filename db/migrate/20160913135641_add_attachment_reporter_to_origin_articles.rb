class AddAttachmentReporterToOriginArticles < ActiveRecord::Migration
  def self.up
    change_table :origin_articles do |t|
      t.attachment :reporter_photo
      t.string :reporter_name
    end
  end

  def self.down
    remove_attachment :origin_articles, :reporter_photo
  end
end
