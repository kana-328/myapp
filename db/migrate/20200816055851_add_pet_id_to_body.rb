class AddPetIdToBody < ActiveRecord::Migration[5.2]
  def change
    add_column :bodies, :pet_id, :integer, foreign_key: true
  end
end
