class AddSexToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :sex, :string
  end
end
