class AddmedicineToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :medicine, :string
  end
end
