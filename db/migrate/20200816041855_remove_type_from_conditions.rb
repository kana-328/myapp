class RemoveTypeFromConditions < ActiveRecord::Migration[5.2]
  def change
    remove_column :conditions, :type, :string
  end
end
