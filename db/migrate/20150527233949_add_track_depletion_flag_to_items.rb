class AddTrackDepletionFlagToItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.boolean :replenishable
    end
  end
end
