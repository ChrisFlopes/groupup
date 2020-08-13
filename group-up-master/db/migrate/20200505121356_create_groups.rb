class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :host, index: true, foreign_key: {to_table: :users}
      t.text :additional_info

      t.timestamps
    end
  end
end
