class AddTypeToCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :type, :string
  end
end
