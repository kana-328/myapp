class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false, default: ""
      t.integer :age
      t.datetime :birthday
      t.string :breed
      t.float :weight

      t.timestamps
    end
  end
end
