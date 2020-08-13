class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.references :host, index: true, foreign_key: {to_table: :users}
      t.date :date
      t.time :time
      t.text :additional_info
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
