class RemoveTypeFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :weight, :float
  end
end
