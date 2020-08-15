class AddStaffToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :staff, :string
  end
end
