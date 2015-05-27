class AddContainerTypeToContainers < ActiveRecord::Migration
  def change
    change_table :containers do |t|
      t.belongs_to :container_type, index:true
    end
  end
end
