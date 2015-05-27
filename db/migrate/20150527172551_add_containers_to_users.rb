class AddContainersToUsers < ActiveRecord::Migration
    def change
      change_table :containers do |t|
        t.belongs_to :user, index: true
      end
    end
end
