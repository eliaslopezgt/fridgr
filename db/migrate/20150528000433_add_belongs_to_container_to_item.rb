class AddBelongsToContainerToItem < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.belongs_to :container, index: true
    end
  end
end
