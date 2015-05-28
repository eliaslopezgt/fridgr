class AddDepletionRatioandDaysInContainer < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.integer :depletion_factor
      t.integer :days_in_container
    end
  end
end
