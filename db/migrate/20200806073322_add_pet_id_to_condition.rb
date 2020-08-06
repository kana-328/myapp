class AddPetIdToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :pet_id, :integer, foreign_key: true
  end
end
