class CreateContainerTypes < ActiveRecord::Migration
  def change
    create_table :container_types do |t|
      t.string :name
      t.string :icon

      t.timestamps null: false
    end
  end
end
