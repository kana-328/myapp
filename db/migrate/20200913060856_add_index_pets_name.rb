class AddIndexPetsName < ActiveRecord::Migration[5.2]
  def change
    add_index :pets, [:name]
  end
end
