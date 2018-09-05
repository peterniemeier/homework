class CreatePeopleTable < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.timestamps
      t.string :name, null: false
      t.integer :house_id, null: false
    end
    add_index :people, :house_id
  end
end
