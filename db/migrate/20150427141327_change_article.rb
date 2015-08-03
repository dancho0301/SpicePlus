class ChangeArticle < ActiveRecord::Migration
  def change
    change_table(:articles) do |t|
       t.column :favorites, :integer, default: 0
    end
  end
end
