class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :group
      t.integer :position
      t.integer :measure

      t.timestamps null: false
    end
  end
end
