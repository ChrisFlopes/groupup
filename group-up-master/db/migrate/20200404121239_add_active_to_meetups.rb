class AddActiveToMeetups < ActiveRecord::Migration[5.2]
  def change
    add_column :meetups, :active, :boolean, null: false, default: false
  end
end
