class AddAppetiteToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :appetite, :string
  end
end
