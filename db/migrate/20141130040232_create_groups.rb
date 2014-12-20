class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :master_name
      t.string :address

      t.timestamps
    end
  end
end
