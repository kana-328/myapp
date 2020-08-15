class AddVomitToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :vomit, :string
  end
end
